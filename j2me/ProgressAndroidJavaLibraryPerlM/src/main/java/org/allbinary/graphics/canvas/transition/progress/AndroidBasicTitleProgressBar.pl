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

package org::allbinary::graphics::canvas::transition::progress::AndroidBasicTitleProgressBar;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::canvas::transition::progress::ProgressCanvas','org::allbinary::graphics::displayable::event::DisplayChangeEventListener';

our $RESOURCE = "ProgressImage";
our $background = 0;

sub _init_fields {
    my ($self) = @_;
    $self->{showTitleProgressBarRunnable} = 'org::allbinary::thread::NullRunnable'->getInstance();
    $self->{dismissTitleProgressBarRunnable} = 'org::allbinary::thread::NullRunnable'->getInstance();
    $self->{titleProgressDialogPortionSetProgressRunnable} = 'org::allbinary::thread::NullRunnable'->getInstance();
    $self->{titleProgressDialogSetProgressRunnable} = 'org::allbinary::thread::NullRunnable'->getInstance();
    $self->{midletActivity} = $org::allbinary::AndroidUtil::NULL_ACTIVITY;
    $self->{portion} = 0;
    $self->{IMAGE} = [(undef) x (4)];
    $self->{image} = $javax::microedition::lcdui::NullImage::NULL_IMAGE;
    $self->{animation} = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
}


sub new {
    my ($class, $title, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($title, $backgroundBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->init();
        'org::allbinary::graphics::displayable::event::DisplayChangeEventHandler'->getInstance()->addListenerInterface($self);
        my $size = scalar(@{$self->{IMAGE}});
        for (my $index = 0; $index < $size; $index++) {
            $self->{IMAGE}->[$index] = $javax::microedition::lcdui::NullImage::NULL_IMAGE;
        }
    return $self;
}


sub init {
    my ($self) = @_;
        try {
            if ($org::allbinary::graphics::canvas::transition::progress::AndroidBasicTitleProgressBar::background != 0) {
                'org::allbinary::data::resource::ResourceUtil'->getInstance()->addResource($org::allbinary::graphics::canvas::transition::progress::AndroidBasicTitleProgressBar::RESOURCE, $org::allbinary::graphics::canvas::transition::progress::AndroidBasicTitleProgressBar::background);
                'org::allbinary::image::GameFeatureImageCacheFactory'->init();
                $self->{image} = 'org::allbinary::image::ImageCacheFactory'->getInstance()->getWithKey($org::allbinary::graphics::canvas::transition::progress::AndroidBasicTitleProgressBar::RESOURCE);
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{INIT}, $e);
        }
}


sub initActivity {
    my ($self, $activity) = @_;
        try {
            if ($self->{midletActivity} != $activity) {
                $self->{midletActivity} = $activity;
                $self->{showTitleProgressBarRunnable} = 'org::allbinary::graphics::canvas::transition::progress::ShowTitleProgressBarRunnable'->new($self->{midletActivity}, $self);
                $self->{dismissTitleProgressBarRunnable} = 'org::allbinary::graphics::canvas::transition::progress::DismissTitleProgressBarRunnable'->new($self->{midletActivity}, $self);
                $self->{titleProgressDialogSetProgressRunnable} = 'org::allbinary::graphics::canvas::transition::progress::TitleProgressBarSetProgressRunnable'->new($self->{midletActivity}, $self);
                $self->{titleProgressDialogPortionSetProgressRunnable} = 'org::allbinary::graphics::canvas::transition::progress::TitleProgressBarPortionSetProgressRunnable'->new($self->{midletActivity}, $self);
                $self->loadProgressImages();
            }
            $self->updateCurrent();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{INIT}, $e);
        }
}


sub updateCurrent {
    my ($self) = @_;
        try {
            if (!$self->isBackground()) {
                $self->{animation} = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
            } elsif ($org::allbinary::graphics::canvas::transition::progress::AndroidBasicTitleProgressBar::background != 0) {
                my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
                my $currentImage = undef;
                if ($displayInfo->isPortrait()) {
                    $currentImage = $self->getImage(0);
                } else {
                    $currentImage = $self->getImage(2);
                }
                if (!defined($currentImage)) {
                    $self->{animation} = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
                } else {
                    $self->{animation} = 'org::allbinary::animation::image::ImageAnimation'->new($currentImage, 'org::allbinary::animation::AnimationBehavior'->getInstance());
                }
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{UPDATE}, $e);
        }
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onDisplayChangeEvent {
    my ($self, $displayChangeEvent) = @_;
        try {
            $self->loadProgressImages();
            $self->updateCurrent();
        } catch ($e) {
            $self->{logUtil}->putF($self->{commonStrings}->{EXCEPTION_LABEL} + 'org::allbinary::logic::java::exception::ExceptionUtil'->getInstance()->getStackTrace($e), $self, $self->{canvasStrings}->{ON_DISPLAY_CHANGE_EVENT});
            $self->{animation} = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
        }
}


sub loadProgressImages {
    my ($self) = @_;
        try {
            my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
            my $lastWidth = $displayInfo->getLastWidth();
            my $lastHeight = $displayInfo->getLastHeight();
            if ($displayInfo->isPortraitWH($lastWidth, $lastHeight)) {
                $self->setImages(0, $lastWidth, $lastHeight);
            } else {
                $self->setImages(2, $lastWidth, $lastHeight);
            }
        } catch ($e) {
            $self->{logUtil}->putF("IllegalArgumentException " . 'org::allbinary::logic::java::exception::ExceptionUtil'->getInstance()->getStackTrace($e), $self, "loadProgressImages");
            $self->{animation} = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
        }
}


sub isInitialized {
    my ($self) = @_;
        if ($self->{midletActivity} != $org::allbinary::AndroidUtil::NULL_ACTIVITY) {
            return 1;
        } else {
            return 0;
        }
}


sub start {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{START_METHOD_NAME});
            $self->SUPER::start();
            $self->{midletActivity}->runOnUiThread($self->{showTitleProgressBarRunnable});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{START_METHOD_NAME}, $e);
        }
}


sub end {
    my ($self) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{END_METHOD_NAME});
            $self->{midletActivity}->runOnUiThread($self->{dismissTitleProgressBarRunnable});
            $self->SUPER::end();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{END_METHOD_NAME}, $e);
        }
}


sub addEarlyPortion {
    my ($self, $value, $text, $index) = @_;
        try {
            $self->{portion} = $value;
            $self->SUPER::addEarlyPortion($value, $text, $index);
            if ($self->{midletActivity} != $org::allbinary::AndroidUtil::NULL_ACTIVITY) {
                $self->{midletActivity}->runOnUiThread($self->{titleProgressDialogPortionSetProgressRunnable});
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{ADD_PORTION}, $e);
        }
}


sub addPortion {
    my ($self, $value, $text, $index) = @_;
        try {
            $self->{portion} = $value;
            $self->SUPER::addPortion($value, $text, $index);
            $self->{midletActivity}->runOnUiThread($self->{titleProgressDialogPortionSetProgressRunnable});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{ADD_PORTION}, $e);
        }
}


sub addNormalPortion {
    my ($self, $value, $text) = @_;
        try {
            $self->{portion} = $value;
            $self->SUPER::addNormalPortion($value, $text);
            $self->{midletActivity}->runOnUiThread($self->{titleProgressDialogPortionSetProgressRunnable});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{ADD_PORTION}, $e);
        }
}


sub setValue {
    my ($self, $value) = @_;
        try {
            $self->SUPER::setValue($value);
            $self->{midletActivity}->runOnUiThread($self->{titleProgressDialogSetProgressRunnable});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "setValue", $e);
        }
}


sub waitUntilDisplayed {
    my ($self) = @_;
}


# throws Exception
sub setImages {
    my ($self, $index, $lastWidth, $lastHeight) = @_;
        my $image = $self->{image};
        if ($image != $javax::microedition::lcdui::NullImage::NULL_IMAGE) {
            if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance()->{FULL_SCREEN})) {
                if ($self->{IMAGE}->[$index] == $javax::microedition::lcdui::NullImage::NULL_IMAGE) {
                    $self->{IMAGE}->[$index] = 'org::allbinary::media::image::ImageScaleUtil'->getInstance()->createImage2('org::allbinary::image::ImageCacheFactory'->getInstance(), $image, $lastWidth, $image->getWidth(), $lastHeight - 20.0, $image->getHeight(), 0);
                }
            } else {
                my $nextIndex = $index + 1;
                if ($self->{IMAGE}->[$nextIndex] == $javax::microedition::lcdui::NullImage::NULL_IMAGE) {
                    $self->{IMAGE}->[$nextIndex] = 'org::allbinary::media::image::ImageScaleUtil'->getInstance()->createImage2('org::allbinary::image::ImageCacheFactory'->getInstance(), $image, $lastWidth, $image->getWidth(), $lastHeight - 28.0, $image->getHeight(), 0);
                }
            }
        }
}


# throws Exception
sub initOpenGL {
    my ($self, $graphics) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{INIT});
        $self->{image} = 'org::allbinary::image::GameFeatureImageCacheFactory'->getInstance()->getWithKey($org::allbinary::graphics::canvas::transition::progress::AndroidBasicTitleProgressBar::RESOURCE);
        my $preResourceImageUtil = 'org::allbinary::image::PreResourceImageUtil'->getInstance();
        my $size = scalar(@{$self->{IMAGE}});
        for (my $index = 0; $index < $size; $index++) {
            if ($self->{IMAGE}->[$index] != $javax::microedition::lcdui::NullImage::NULL_IMAGE) {
                $self->{IMAGE}->[$index] = $preResourceImageUtil->encapsulate($self->{IMAGE}->[$index]);
            }
        }
        $self->updateCurrent();
}


# throws Exception
sub update {
    my ($self, $graphics) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{UPDATE});
        $self->initOpenGL($graphics);
        $self->{image} = 'org::allbinary::image::GameFeatureImageCacheFactory'->getInstance()->getWithKey($org::allbinary::graphics::canvas::transition::progress::AndroidBasicTitleProgressBar::RESOURCE);
        my $preResourceImageUtil = 'org::allbinary::image::PreResourceImageUtil'->getInstance();
        my $size = scalar(@{$self->{IMAGE}});
        for (my $index = 0; $index < $size; $index++) {
            if ($self->{IMAGE}->[$index] != $javax::microedition::lcdui::NullImage::NULL_IMAGE) {
                $preResourceImageUtil->update($graphics, $self->{IMAGE}->[$index]);
            }
        }
}


# throws Exception
sub getImage {
    my ($self, $index) = @_;
        my $image = $javax::microedition::lcdui::NullImage::NULL_IMAGE;
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::MainFeatureFactory'->getInstance()->{FULL_SCREEN})) {
            $image = $self->{IMAGE}->[$index];
        } else {
            $image = $self->{IMAGE}->[$index + 1];
        }
        return $image;
}


sub paint2 {
    my ($self, $graphics) = @_;
        try {
            $self->{animation}->paintXY($graphics, 0, 20);
            $self->SUPER::paint2($graphics);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{canvasStrings}->{PAINT}, $e);
        }
}


sub setBackgroundResource {
    my ($class, $background) = @_;
        $org::allbinary::graphics::canvas::transition::progress::AndroidBasicTitleProgressBar::background = $background;
}


sub setBackground {
    my ($self, $background) = @_;
        $self->SUPER::setBackground($background);
        $self->updateCurrent();
}


sub setPortion {
    my ($self, $portion) = @_;
        $self->{portion} = $portion;
}


sub getPortion {
    my ($self) = @_;
        return $self->{portion};
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use android::app::Activity;
use org::allbinary::AndroidUtil;
use org::allbinary::image::GameFeatureImageCacheFactory;
use org::allbinary::image::PreResourceImageUtil;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::java::exception::ExceptionUtil;
use org::allbinary::animation::Animation;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::MainFeatureFactory;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::displayable::event::DisplayChangeEvent;
use org::allbinary::graphics::displayable::event::DisplayChangeEventHandler;
use org::allbinary::graphics::displayable::event::DisplayChangeEventListener;
use org::allbinary::image::ImageCacheFactory;
use org::allbinary::media::image::ImageScaleUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::image::ImageAnimation;
use org::allbinary::data::resource::ResourceUtil;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::thread::ARunnable;
use org::allbinary::thread::NullRunnable;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;
use org::allbinary::graphics::canvas::transition::progress::ShowTitleProgressBarRunnable;
use org::allbinary::graphics::canvas::transition::progress::DismissTitleProgressBarRunnable;
use org::allbinary::graphics::canvas::transition::progress::TitleProgressBarSetProgressRunnable;
use org::allbinary::graphics::canvas::transition::progress::TitleProgressBarPortionSetProgressRunnable;

1;

