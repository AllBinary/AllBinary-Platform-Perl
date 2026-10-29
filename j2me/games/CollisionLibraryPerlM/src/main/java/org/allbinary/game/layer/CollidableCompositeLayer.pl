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

package org::allbinary::game::layer::CollidableCompositeLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::AllBinaryGameLayer','org::allbinary::game::collision::CollidableInterfaceCompositeInterface';

our $NULL_COLLIDABLE_COMPOSITE_LAYER = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{collidableInferface} = 'org::allbinary::game::collision::CollidableNeverCollideBehaviorFactory'->getInstance()->createBehavior();
}


sub getNullInstance {
    my ($class) = @_;
        if ($org::allbinary::game::layer::CollidableCompositeLayer::NULL_COLLIDABLE_COMPOSITE_LAYER == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::layer::CollidableCompositeLayer::NULL_COLLIDABLE_COMPOSITE_LAYER = 'org::allbinary::game::layer::CollidableCompositeLayer'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $org::allbinary::graphics::RectangleFactory::SINGLETON, $org::allbinary::view::ViewPositionBase::NULL_VIEW_POSITION, 'org::allbinary::game::collision::CollidableNeverCollideBehaviorFactory'->getInstance());
        }
        return $org::allbinary::game::layer::CollidableCompositeLayer::NULL_COLLIDABLE_COMPOSITE_LAYER;
}


sub new {
    my ($class, $name, $layerInfo, $viewPosition, $collidableBaseBehaviorFactory) = @_;
    my $self = $class->SUPER::new($name, $layerInfo, $viewPosition);
    $self->_init_fields();
        # super(...) made $self above
        if ($collidableBaseBehaviorFactory != 'org::allbinary::game::collision::CollidableNeverCollideBehaviorFactory'->getInstance()) {
            $self->setCollidableInferface($collidableBaseBehaviorFactory->createBehavior());
        }
    return $self;
}


sub getArtificialIntelligenceInterface {
    my ($self) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log($self->{commonStrings}->{NOT_IMPLEMENTED}, $self);
        return 'org::allbinary::ai::ArtificialIntelligence'->getInstance();
}


sub getCollidableInferface {
    my ($self) = @_;
        return $self->{collidableInferface};
}


sub setCollidableInferface {
    my ($self, $collidableInferface) = @_;
        $self->{collidableInferface} = $collidableInferface;
}


sub implmentsCollidableInterface {
    my ($self) = @_;
        return 1;
}


sub toStringAppend {
    my ($self, $stringBuffer) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        $self->SUPER::toStringAppend($stringBuffer);
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append($self->getCollidableInferface()->toString());
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $self->toStringAppend($stringBuffer);
        return $stringBuffer->toString();
}

use org::allbinary::ai::ArtificialIntelligence;
use org::allbinary::ai::ArtificialIntelligenceInterface;
use org::allbinary::game::collision::CollidableBaseBehavior;
use org::allbinary::game::collision::CollidableBaseBehaviorFactory;
use org::allbinary::game::collision::CollidableInterfaceCompositeInterface;
use org::allbinary::game::collision::CollidableNeverCollideBehaviorFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::RectangleFactory;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::logic::NullUtil;
use org::allbinary::game::layer::AllBinaryGameLayer;

1;

