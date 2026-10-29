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

package org::allbinary::game::layer::AllBinaryGameLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::layer::AllBinaryLayer','org::allbinary::view::event::ViewPositionEventListenerInterface','org::allbinary::image::opengles::OpenGLSurfaceChangedInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{basicSetColorUtil} = 'org::allbinary::graphics::color::BasicColorSetUtil'->getInstance();
    $self->{RED} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED};
    $self->{paintable} = ($org::allbinary::game::layer::SWTUtil::isSWT ? do {
        package org::allbinary::graphics::paint::Paintable::AnonymousN66404 { our @ISA = ('org::allbinary::graphics::paint::Paintable');
        $self->{basicSetColorUtil} = 'org::allbinary::graphics::color::BasicColorSetUtil'->getInstance();
        $self->{BLACK} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK};
        

        sub paint {
            my ($self, $graphics) = @_;
            $self->{basicSetColorUtil}->setBasicColorP($graphics, $self->{BLACK});
        }
        }
        'org::allbinary::graphics::paint::Paintable::AnonymousN66404'->can('new') ? 'org::allbinary::graphics::paint::Paintable::AnonymousN66404'->new() : bless({}, 'org::allbinary::graphics::paint::Paintable::AnonymousN66404')
    } : 'org::allbinary::graphics::paint::NullPaintable'->getInstance());
    $self->{gameKeyEventList} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub new {
    my ($class, $name, $layerInfo, $viewPosition) = @_;
    my $self = $class->SUPER::new($name, $layerInfo, $viewPosition);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub set {
    my ($self, $gl) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


sub move {
    my ($self) = @_;
}


sub getGameKeyEventList {
    my ($self) = @_;
        return $self->{gameKeyEventList};
}


# throws Exception
sub processInput {
    my ($self, $allBinaryLayerManager) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub processTick {
    my ($self, $allBinaryLayerManager) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


# throws Exception
sub onViewPositionChangeEvent {
    my ($self) = @_;
        $self->onChangeEvent($self->{viewPositionEvent});
}


# throws Exception
sub onChangeEvent {
    my ($self, $layerManagerEvent) = @_;
        if ('org::allbinary::game::layer::GameLayerUtil'->isOnScreen($self)) {
            $self->setVisible(1);
        } else {
            $self->setVisible(0);
        }
}


sub paintFirst {
    my ($self, $graphics) = @_;
        $self->{paintable}->paint($graphics);
}


sub paintDebug {
    my ($self, $graphics) = @_;
        my $viewPosition = $self->getViewPosition();
        my $viewX = $viewPosition->getX();
        my $viewY = $viewPosition->getY();
        $self->{basicSetColorUtil}->setBasicColorP($graphics, $self->{RED});
        $graphics->drawRect($viewX, $viewY, $self->getWidth(), $self->getHeight());
}


sub setWidth {
    my ($self, $width) = @_;
        $self->SUPER::setLayerWidth($width);
        $self->setHalfWidth(POSIX::floor(($width) / (2 ** (1))));
}


sub setHeight {
    my ($self, $height) = @_;
        $self->SUPER::setLayerHeight($height);
        $self->setHalfHeight(POSIX::floor(($height) / (2 ** (1))));
}

# use javax::microedition::khronos::opengles::GL;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::color::BasicColorSetUtil;
use org::allbinary::graphics::paint::NullPaintable;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::image::opengles::OpenGLSurfaceChangedInterface;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::view::event::ViewPositionEvent;
use org::allbinary::view::event::ViewPositionEventListenerInterface;
use org::allbinary::game::layer::SWTUtil;
use org::allbinary::game::layer::GameLayerUtil;

1;

