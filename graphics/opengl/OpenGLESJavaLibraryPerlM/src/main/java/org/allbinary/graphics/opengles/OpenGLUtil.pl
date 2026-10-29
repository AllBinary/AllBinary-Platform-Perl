# Generated Code Do Not Modify

package org::allbinary::graphics::opengles::OpenGLUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::opengles::OpenGLUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{renderStrings} = 'org::allbinary::graphics::opengles::renderer::RendererStrings'->getInstance();
    $self->{canvasStrings} = 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance();
    $self->{displayInfoSingleton} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{preResourceImageUtil} = 'org::allbinary::image::PreResourceImageUtil'->getInstance();
    $self->{lockObject} = 'org::allbinary::thread::SynchObject'->new();
    $self->{anyType} = 'org::allbinary::thread::SynchObject'->new();
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{runnableList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{created} = 0;
    $self->{surfaceCreatedAndInitialized} = 0;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::OpenGLUtil::instance;
}


sub onSurfaceCreated {
    my ($self, $gl) = @_;
        try {
            if (!$self->{created}) {
                $self->{created} = 1;
                'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL} . 'org::allbinary::graphics::opengles::OpenGLCapabilities'->getInstance()->toString(), $self, $self->{renderStrings}->{ON_SURFACE_CREATED});
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{renderStrings}->{ON_SURFACE_CREATED}, $e);
        }
}


# Java overloaded method: Perl keeps the last definition
sub onSurfaceCreated {
    my ($self, $gl, $loadTextures) = @_;
        try {
            $loadTextures->load($gl);
            'org::allbinary::graphics::opengles::OpenGLLogUtil'->getInstance()->logError($gl);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{renderStrings}->{ON_SURFACE_CREATED}, $e);
        }
}


# throws Exception
sub onSurfaceChanged {
    my ($self, $gl, $graphics) = @_;
        if (!$self->{surfaceCreatedAndInitialized}) {
            $graphics->init();
            $self->{surfaceCreatedAndInitialized} = 1;
        }
        $graphics->update();
        my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
        $progressCanvas->update($graphics);
        ('org::allbinary::image::opengles::OpenGLImageCacheFactory'->getInstance())->update($gl);
        $self->processRunnables();
        $self->set($gl);
}


sub addImage {
    my ($self, $image) = @_;
        my $encapsulateImage = $self->{preResourceImageUtil}->encapsulate($image);
        if ($encapsulateImage != $image) {
            { # synchronized ($self->{anyType})
                $self->{list}->add($encapsulateImage);
            }
            return $encapsulateImage;
        }
        return $image;
}


sub clear {
    my ($self) = @_;
        { # synchronized ($self->{anyType})
            $self->{list}->clear();
        }
}


sub addRunnable {
    my ($self, $runnable) = @_;
        { # synchronized ($self->{lockObject})
            if (!$self->{runnableList}->contains($runnable)) {
                $self->{runnableList}->add($runnable);
                $self->{displayInfoSingleton}->add($self->{canvasStrings}->{SCALED_IMAGES});
            }
        }
}


sub processRunnables {
    my ($self) = @_;
        { # synchronized ($self->{lockObject})
            my $runnable = undef;
            my $size = $self->{runnableList}->size();
            for (my $index = 0; $index < $size; $index++) {
                $runnable = $self->{runnableList}->get($index);
                $runnable->run();
            }
            $self->{runnableList}->clear();
        }
}


# throws Exception
sub set {
    my ($self, $gl) = @_;
        my $size = $self->{list}->size();
        my $image = undef;
        for (my $index2 = 0; $index2 < $size; $index2++) {
            $image = $self->{list}->get($index2);
            ($image)->set($gl);
        }
}

# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::lcdui::Image;
use org::allbinary::device::LoadTextures;
use org::allbinary::device::OpenGLESGraphics;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::opengles::renderer::RendererStrings;
use org::allbinary::image::PreResourceImageUtil;
use org::allbinary::image::opengles::OpenGLESImage;
use org::allbinary::image::opengles::OpenGLImageCache;
use org::allbinary::image::opengles::OpenGLImageCacheFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::thread::SynchObject;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::graphics::opengles::OpenGLCapabilities;
use org::allbinary::graphics::opengles::OpenGLLogUtil;

1;

