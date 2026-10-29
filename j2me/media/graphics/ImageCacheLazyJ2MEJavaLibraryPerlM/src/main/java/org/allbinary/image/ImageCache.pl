#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#   
# Generated Code Do Not Modify

package org::allbinary::image::ImageCache;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::image::ImageCacheBase';

our $NULL_IMAGE_CACHE = 'org::allbinary::image::ImageCache'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
    $self->{concurrentImageLoadingProcessor} = 'org::allbinary::thread::ConcurrentImageLoadingProcessor'->new($self);
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
    $self->{resourceUtil} = 'org::allbinary::data::resource::ResourceUtil'->getInstance();
    $self->{gameGlobalsFactory} = 'org::allbinary::canvas::GameGlobalsFactory'->getInstance();
    $self->{gdResources} = 'org::allbinary::game::gd::resource::GDResources'->getInstance();
    $self->{loadNowList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{loadSoonList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{loadList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{loadAfterList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{lock} = 'org::allbinary::thread::SynchObject'->new();
    $self->{firstTime} = 1;
    $self->{totalLoaded} = 0;
    $self->{progressEnded} = 0;
    $self->{hasAnyLazyAnimationFactories} = 0;
    $self->{processor} = 'org::allbinary::image::FirstProcessor'->new();
    $self->{endProcessor} = 'org::allbinary::canvas::Processor'->getInstance();
    $self->{LOAD_IMAGE_FOR_ANIMATION} = "Load Image Animation";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub firstProcess {
    my ($self) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $isHTML = 'org::allbinary::J2MEUtil'->isHTML();
        if ($isHTML) {
            $self->{processor} = 'org::allbinary::canvas::Processor'->getInstance();
            $self->{endProcessor} = 'org::allbinary::image::HTMLEndProcessor'->new();
        } else {
            $self->{processor} = 'org::allbinary::image::NotHTMLProcessor'->new();
            $self->{endProcessor} = 'org::allbinary::image::NotHTMLEndProcessor'->new();
            try {
                $self->runTask();
            } catch ($e) {
                $logUtil->putF($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{END_METHOD_NAME});
            }
        }
}


sub addListener {
    my ($self, $renderer) = @_;
}


# throws Exception
sub waitForLoadNow {
    my ($self) = @_;
        if ($self->{firstTime}) {
            my $abToGBUtil = 'org::allbinary::game::canvas::ABToGBUtil'->getInstance();
            my $abCanvas = $abToGBUtil->{abCanvas};
            while ($self->{loadNowList}->isEmpty() && (!$abCanvas->isInitialized() || ($abCanvas->isInitialized() && $self->{hasAnyLazyAnimationFactories})) && !$self->{progressEnded}) {
                Time::HiRes::sleep((120) / 1000);
            }
            $self->{firstTime} = 0;
        }
}


# throws Exception
sub loadImageForAnimation {
    my ($self) = @_;
        my $lazyImageRotationAnimation = undef;
        { # synchronized ($self->{lock})
            if ($self->{loadNowList}->isEmpty()) {
                $self->{endProcessor}->process();
                if ($self->{loadSoonList}->isEmpty()) {
                    if ($self->{loadAfterList}->isEmpty()) {
                        if ($self->{firstTime}) {
                        } elsif ($self->{gameGlobalsFactory}->{newCanvas}) {
                        } else {
                            $self->loadNextImage();
                        }
                        return;
                    } else {
                        $lazyImageRotationAnimation = $self->{loadAfterList}->get(0);
                        if ($self->loadImageForLazyAnimation($lazyImageRotationAnimation)) {
                            $self->{loadAfterList}->remove($lazyImageRotationAnimation);
                        }
                    }
                } else {
                    $lazyImageRotationAnimation = $self->{loadSoonList}->get(0);
                    if ($self->loadImageForLazyAnimation($lazyImageRotationAnimation)) {
                        $self->{loadSoonList}->remove($lazyImageRotationAnimation);
                    }
                }
                return;
            }
            $lazyImageRotationAnimation = $self->{loadNowList}->get(0);
        }
        if ($self->loadImageForLazyAnimation($lazyImageRotationAnimation)) {
            { # synchronized ($self->{lock})
                $self->{loadNowList}->remove($lazyImageRotationAnimation);
            }
            if ($lazyImageRotationAnimation->{layoutIndex} != 0) {
                my $list = $self->getAssociated($lazyImageRotationAnimation);
                { # synchronized ($self->{lock})
                    my $size = $list->size();
                    if ($size > 0) {
                        $self->{loadSoonList}->addAllList($list);
                    }
                }
            }
            my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
            my $isHTML = 'org::allbinary::J2MEUtil'->isHTML();
            if ($self->{loadNowList}->isEmpty() && (!$isHTML || $self->{firstTime})) {
                $progressCanvas->endFromInitialLazyLoadingComplete();
            } else {
                if ($self->{totalLoaded} % 10 == 0) {
                    $progressCanvas->addNormalPortion(1, $self->{LOAD_IMAGE_FOR_ANIMATION});
                }
            }
        }
}


# throws Exception
sub loadImages {
    my ($self) = @_;
        while (!$self->{loadList}->isEmpty() || !$self->{loadNowList}->isEmpty()) {
            $self->loadImageForAnimations();
            $self->loadNextImage();
        }
}


# throws Exception
sub loadImageForAnimations {
    my ($self) = @_;
        while (!$self->{loadNowList}->isEmpty()) {
            $self->loadImageForAnimation();
        }
}


# throws Exception
sub loadRemainingAnimations {
    my ($self) = @_;
        while (!$self->{loadAfterList}->isEmpty() || !$self->{loadNowList}->isEmpty()) {
            while (!$self->{loadNowList}->isEmpty()) {
                $self->loadImageForAnimation();
            }
            my $lazyImageRotationAnimation = undef;
            { # synchronized ($self->{lock})
                if (!$self->{loadAfterList}->isEmpty()) {
                    $lazyImageRotationAnimation = $self->{loadAfterList}->removeAt(0);
                }
            }
            if (defined($lazyImageRotationAnimation)) {
                $self->loadImageForLazyAnimation($lazyImageRotationAnimation);
            }
        }
}


# throws Exception
sub loadImageForLazyAnimation {
    my ($self, $lazyImageRotationAnimation) = @_;
        my $image = $lazyImageRotationAnimation->{animationInterfaceFactoryInterface}->getImage();
        if ($self->loadImage($image)) {
            $lazyImageRotationAnimation->setRealAnimation();
            return 1;
        }
        return 0;
}


# throws Exception
sub loadNextImage {
    my ($self) = @_;
        my $image = undef;
        { # synchronized ($self->{lock})
            if ($self->{loadList}->size() == 0) {
                return;
            }
            $image = $self->{loadList}->removeAt(0);
        }
        $self->loadImage($image);
}


# throws Exception
sub loadImage {
    my ($self, $image) = @_;
        if ($image->isReady()) {
            return 1;
        } else {
            if (defined($image->getImage())) {
                if ($image->setReady()) {
                    if ($image->isReady()) {
                        $self->{totalLoaded}++;
                        return 1;
                    }
                }
            } else {
                my $key = $image->getName();
                my $image2 = $self->creatImage($key);
                if ($image2->isReady()) {
                    $self->init($image, $image2);
                    return 1;
                } else {
                    $image->setImage($image2->getImage());
                }
            }
        }
        return 0;
}


# throws Exception
sub init {
    my ($self, $image, $image2) = @_;
        $image->init($image2->getImage());
}


# throws Exception
sub creatImage {
    my ($self, $key) = @_;
        my $inputStream = $self->{resourceUtil}->getResourceAsStream($key);
        my $image = 'org::allbinary::image::ImageFactory'->getInstance()->createImageFromInputStream($inputStream);
        $image->setName($key);
        return $image;
}


# throws Exception
sub get {
    my ($self, $caller, $width, $height) = @_;
        my $foundIndex = $self->getIndexWH($width, $height);
        my $image = $self->getFromAvailable($foundIndex, $width, $height);
        if ($image == $javax::microedition::lcdui::NullImage::NULL_IMAGE) {
            $self->{volume} += $width * $height;
            if ($self->{volume} > 32000) {
                $self->{tsUtil}->gc();
                $self->{volume} = 0;
            }
            $image = $self->createImage($caller, $width, $height);
            if ($self->{nextIndex} > scalar(@{$self->{widths}}) - 1) {
                if ($foundIndex == -1) {
                    $foundIndex = $self->{nextIndex};
                    $self->{widths}->[$self->{nextIndex}] = $width;
                    $self->{heights}->[$self->{nextIndex}] = $height;
                    $self->{nextIndex}++;
                }
                $self->{listOfList}->[$foundIndex]->add($image);
            }
        }
        return $image;
}


# throws Exception
sub getWithKey {
    my ($self, $key) = @_;
        my $image = $self->getImage($key);
        if ($image == $javax::microedition::lcdui::NullImage::NULL_IMAGE) {
            my $inputStream = undef;
            try {
                $image = $self->createImageFromInputStream($key, $inputStream);
            } catch ($e) {
                $self->{logUtil}->put("Exception: Trying Again After GC", $self, $self->{commonStrings}->{GET}, $e);
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("InputStream: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($inputStream))->toString(), $self, $self->{commonStrings}->{GET});
                $self->{tsUtil}->gc();
                $self->{tsUtil}->gc();
                $self->{logUtil}->putF('org::allbinary::system::Memory'->getInfo(), $self, $self->{commonStrings}->{GET});
                Time::HiRes::sleep((100) / 1000);
                $image = $self->createImageFromInputStream($key, $inputStream);
            }
            $self->{hashtable}->put($key, $image);
        }
        return $image;
}


sub getIndex {
    my ($self, $key) = @_;
        my $gdResources = 'org::allbinary::game::gd::resource::GDResources'->getInstance();
        my $resourceStringArray = $gdResources->{resourceStringArray};
        my $size = scalar(@{$resourceStringArray});
        for (my $index = 0; $index < $size; $index++) {
            if ($resourceStringArray->[$index] eq $key) {
                return $index;
            }
        }
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("unable to find key: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($key))->toString(), $self, $self->{commonStrings}->{RUN});
        die ("RuntimeException");
}


# throws Exception
sub createImageFromInputStream {
    my ($self, $key, $inputStream) = @_;
        my $gdLazyResources = 'org::allbinary::game::gd::resource::GDLazyResources'->getInstance();
        my $resourceStringArray = $gdLazyResources->{requiredResourcesBeforeLoadingArray};
        my $size = scalar(@{$resourceStringArray});
        for (my $index = 0; $index < $size; $index++) {
            if ($key eq $resourceStringArray->[$index]) {
                return $self->creatImage($key);
            }
        }
        $self->runTask();
        my $index = $self->getIndex($key);
        my $width = $gdLazyResources->{imageResourceWidthArray}->[$index];
        my $height = $gdLazyResources->{imageResourceHeightArray}->[$index];
        my $image = $self->createImageLater($key, $width, $height);
        { # synchronized ($self->{lock})
            $self->{loadList}->add($image);
        }
        return $image;
}


# throws Exception
sub createImageLater {
    my ($self, $key, $width, $height) = @_;
        return 'javax::microedition::lcdui::Image'->createImageLater($key, $width, $height);
}


sub getAssociated {
    my ($self, $lazyImageRotationAnimation) = @_;
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        { # synchronized ($self->{lock})
            my $lazyImageRotationAnimation2 = undef;
            my $size = $self->{loadAfterList}->size();
            for (my $index = 0; $index < $size; $index++) {
                $lazyImageRotationAnimation2 = $self->{loadAfterList}->get($index);
                if ($lazyImageRotationAnimation2->{instanceId} == $lazyImageRotationAnimation->{instanceId}) {
                    $list->add($lazyImageRotationAnimation2);
                }
            }
            my $size2 = $list->size();
            for (my $index = 0; $index < $size2; $index++) {
                $self->{loadAfterList}->remove($list->get($index));
            }
        }
        return $list;
}


sub add {
    my ($self, $lazyImageRotationAnimation) = @_;
        { # synchronized ($self->{lock})
            $self->{loadAfterList}->add($lazyImageRotationAnimation);
        }
}


# throws Exception
sub insertFirst {
    my ($self, $lazyImageRotationAnimation) = @_;
        if ($self->{loadNowList}->contains($lazyImageRotationAnimation)) {
        } else {
            { # synchronized ($self->{lock})
                $self->{loadNowList}->add($lazyImageRotationAnimation);
                $self->{loadAfterList}->remove($lazyImageRotationAnimation);
            }
        }
        $self->runTask();
}


sub progressEnded {
    my ($self) = @_;
        $self->{progressEnded} = 1;
}


# throws Exception
sub runTask {
    my ($self) = @_;
        $self->{processor}->process();
}


sub initProgress {
    my ($self) = @_;
        if ($self->{firstTime}) {
            $self->{firstTime} = 0;
        }
}


sub isLazy {
    my ($self) = @_;
        return 1;
}
{
    package org::allbinary::image::NotHTMLProcessor;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use Time::HiRes ();
    use parent -norequire,'org::allbinary::canvas::Processor';
    

    sub new {
        my ($class) = @_;
        my $self = $class->SUPER::new();
        return $self;
    }
    

    sub process {
        my ($self) = @_;
            $self->{concurrentImageLoadingProcessor}->runTask();
    }
    }

{
    package org::allbinary::image::NotHTMLEndProcessor;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use Time::HiRes ();
    use parent -norequire,'org::allbinary::canvas::Processor';
    

    sub new {
        my ($class) = @_;
        my $self = $class->SUPER::new();
        return $self;
    }
    

    sub process {
        my ($self) = @_;
            my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
            $progressCanvas->endIfPaintedSinceStart();
    }
    }

{
    package org::allbinary::image::HTMLEndProcessor;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use Time::HiRes ();
    use parent -norequire,'org::allbinary::canvas::Processor';
    

    sub new {
        my ($class) = @_;
        my $self = $class->SUPER::new();
        return $self;
    }
    

    sub process {
        my ($self) = @_;
            my $size = $self->{gdResources}->{currentLayoutRequiredTotal};
            if ($size == 0) {
                my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
                $progressCanvas->endIfPaintedSinceStart();
            } elsif ($self->{totalLoaded} > int($size / 12)) {
                my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
                $progressCanvas->endIfPaintedSinceStart();
                $self->{endProcessor} = 'org::allbinary::image::NotHTMLEndProcessor'->new();
            }
    }
    }

{
    package org::allbinary::image::FirstProcessor;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use Time::HiRes ();
    use parent -norequire,'org::allbinary::canvas::Processor';
    

    sub new {
        my ($class) = @_;
        my $self = $class->SUPER::new();
        return $self;
    }
    

    sub process {
        my ($self) = @_;
            $self->firstProcess();
    }
    }


# use java::io::InputStream;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::J2MEUtil;
use org::allbinary::TsUtil;
use org::allbinary::animation::image::LazyImageRotationAnimation;
use org::allbinary::canvas::GameGlobalsFactory;
use org::allbinary::canvas::Processor;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::game::canvas::ABToGBUtil;
use org::allbinary::game::displayable::canvas::AllBinaryGameCanvas;
use org::allbinary::game::gd::resource::GDLazyResources;
use org::allbinary::game::gd::resource::GDResources;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::system::Memory;
use org::allbinary::thread::BaseImageLoadingProcessor;
use org::allbinary::thread::ConcurrentImageLoadingProcessor;
use org::allbinary::thread::SynchObject;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::ABSystemWrapper;
use org::allbinary::image::ImageCacheBase;
use java::lang::Thread;
use org::allbinary::image::ImageFactory;

1;

