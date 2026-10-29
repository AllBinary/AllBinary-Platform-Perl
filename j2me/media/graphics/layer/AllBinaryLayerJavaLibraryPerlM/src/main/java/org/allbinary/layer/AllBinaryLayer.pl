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

package org::allbinary::layer::AllBinaryLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::layer::Layer','org::allbinary::layer::LayerInterface';

our $NULL_ALLBINARY_LAYER = 'org::allbinary::layer::AllBinaryLayer'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $org::allbinary::graphics::RectangleFactory::SINGLETON, $org::allbinary::view::ViewPositionBase::NULL_VIEW_POSITION);
our $TYPE = "Type: ";

sub _init_fields {
    my ($self) = @_;
    $self->{viewPositionEvent} = 'org::allbinary::view::event::ViewPositionEvent'->new($self);
    $self->{halfWidth} = 0;
    $self->{halfHeight} = 0;
    $self->{name} = undef;
    $self->{viewPosition} = $org::allbinary::view::ViewPositionBase::NULL_VIEW_POSITION;
}


sub new {
    my ($class, $name, $rectangle, $viewPosition) = @_;
    my $self = $class->SUPER::new($rectangle->getWidth(), $rectangle->getHeight());
    $self->_init_fields();
        # super(...) made $self above
        my $localName = undef;
        if (!defined($name)) {
            $localName = ref($self);
        } else {
            $localName = 'org::allbinary::logic::string::StringMaker'->new()->append($name)->append('org::allbinary::string::CommonSeps'->getInstance()->{COLON})->append(sprintf("%x", 'org::allbinary::TsUtil'->getInstance()->hashCode($self)))->toString();
        }
        $self->{name} = $localName;
        my $point = $rectangle->getPoint();
        $self->setPosition($point->getX(), $point->getY(), $point->getZ());
        $self->setHalfWidth((POSIX::floor(($self->getWidth()) / (2 ** (1)))));
        $self->setHalfHeight((POSIX::floor(($self->getHeight()) / (2 ** (1)))));
        $self->{viewPosition} = $viewPosition;
        $self->{viewPosition}->setAllbinaryLayer($self);
    return $self;
}


# throws Exception
sub onChangeEvent {
    my ($self, $layerManagerEvent) = @_;
}


sub paintThreed {
    my ($self, $graphics) = @_;
}


sub getX2 {
    my ($self) = @_;
        return $self->getXP() + $self->getWidth();
}


sub getY2 {
    my ($self) = @_;
        return $self->getYP() + $self->getHeight();
}


sub getZ2 {
    my ($self) = @_;
        return int(($self->getZP() + $self->getDepth()));
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setHalfWidth {
    my ($self, $halfWidth) = @_;
        $self->{halfWidth} = $halfWidth;
}


sub getHalfWidth {
    my ($self) = @_;
        return $self->{halfWidth};
}


sub setHalfHeight {
    my ($self, $halfHeight) = @_;
        $self->{halfHeight} = $halfHeight;
}


sub getHalfHeight {
    my ($self) = @_;
        return $self->{halfHeight};
}


sub getHalfDepth {
    my ($self) = @_;
        return int(int($self->getDepth()) / 2);
}


sub getViewPosition {
    my ($self) = @_;
        return $self->{viewPosition};
}


sub setViewPosition {
    my ($self, $viewPosition) = @_;
        $self->{viewPosition} = $viewPosition;
}


sub getGroupInterface {
    my ($self) = @_;
        return 'org::allbinary::game::identification::BasicGroupFactory'->getInstance()->{NONE_ARRAY};
}


sub implmentsTickableInterface {
    my ($self) = @_;
        return 0;
}


sub implmentsGameInputInterface {
    my ($self) = @_;
        return 0;
}


sub implmentsArtificialIntelligenceCompositeInterface {
    my ($self) = @_;
        return 0;
}


sub implmentsCollidableInterface {
    my ($self) = @_;
        return 0;
}


sub implementsThreedInterface {
    my ($self) = @_;
        return 'org::allbinary::graphics::opengles::OpenGLFeatureUtil'->getInstance()->isAnyThreed();
}


sub getType {
    my ($self) = @_;
        return -1;
}


sub getMultiPlayerType {
    my ($self) = @_;
        return -1;
}


sub toStringAppend {
    my ($self, $stringBuffer) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $positionStrings = 'org::allbinary::math::PositionStrings'->getInstance();
        my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
        $stringBuffer->append($self->getName());
        $stringBuffer->append($commonSeps->{COLON});
        $stringBuffer->append($org::allbinary::layer::AllBinaryLayer::TYPE);
        $stringBuffer->appendint($self->getType());
        $stringBuffer->append($commonSeps->{SPACE});
        $stringBuffer->append($positionStrings->{X_LABEL});
        $stringBuffer->appendint(int($self->getXP()));
        $stringBuffer->append($commonSeps->{SPACE});
        $stringBuffer->append($positionStrings->{Y_LABEL});
        $stringBuffer->appendint(int($self->getYP()));
        $stringBuffer->append($commonSeps->{SPACE});
        $stringBuffer->append($positionStrings->{Z_LABEL});
        $stringBuffer->appendint(int($self->getZP()));
        $stringBuffer->append($commonSeps->{SPACE});
        $stringBuffer->append($commonLabels->{WIDTH_LABEL});
        $stringBuffer->appendint(int($self->getWidth()));
        $stringBuffer->append($commonSeps->{SPACE});
        $stringBuffer->append($commonLabels->{HEIGHT_LABEL});
        $stringBuffer->appendint(int($self->getHeight()));
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $self->toStringAppend($stringBuffer);
        return $stringBuffer->toString();
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::identification::BasicGroupFactory;
use org::allbinary::game::identification::Group;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::RectangleFactory;
use org::allbinary::graphics::opengles::OpenGLFeatureUtil;
use org::allbinary::TsUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::math::PositionStrings;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::view::event::ViewPositionEvent;
use org::allbinary::layer::Layer;
use org::allbinary::layer::LayerInterface;

1;

