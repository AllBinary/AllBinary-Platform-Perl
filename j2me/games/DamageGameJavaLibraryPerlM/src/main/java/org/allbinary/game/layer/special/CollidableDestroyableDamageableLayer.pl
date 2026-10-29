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

package org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::CollidableCompositeLayer','org::allbinary::game::combat::destroy::DestroyableInterface','org::allbinary::game::combat::damage::DamageableInterface','org::allbinary::game::layer::pickup::PickupCompositeInterface','org::allbinary::game::layer::special::SpecialGameInputInterface';

our $NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
our $READYFOREXPLOSION = "ReadyForExplosion: ";

sub _init_fields {
    my ($self) = @_;
    $self->{groupInterface} = undef;
    $self->{readyForExplosion} = 0;
    $self->{initWidth} = undef;
    $self->{initHeight} = undef;
    $self->{initX} = 0;
    $self->{initY} = 0;
    $self->{initZ} = 0;
    $self->{partInterfaceArrayP} = 'org::allbinary::game::part::PartInterfaceUtil'->getZeroArray();
    $self->{pickupBehavior} = undef;
    $self->{allBinaryGameLayerManagerP} = 'org::allbinary::game::layer::AllBinaryGameLayerManager'->getNullInstance();
    $self->{isDraggable} = 0;
    $self->{isDragged} = 0;
    $self->{isDropped} = 0;
}


sub getNullInstance {
    my ($class) = @_;
        if ($org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer::NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer::NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER = 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->new('org::allbinary::game::identification::BasicGroupFactory'->getInstance()->{NONE_ARRAY}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $org::allbinary::graphics::RectangleFactory::SINGLETON, $org::allbinary::view::ViewPositionBase::NULL_VIEW_POSITION);
        }
        return $org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer::NULL_COLLIDABLE_DESTROYABLE_DAMAGE_LAYER;
}


sub new {
    my ($class, $groupInterface, $name, $layerInfo, $viewPosition) = @_;
    my $self = $class->SUPER::new($name, $layerInfo, $viewPosition, 'org::allbinary::game::collision::CollidableNeverCollideBehaviorFactory'->getInstance());
    $self->_init_fields();
        # super(...) made $self above
        $self->{initWidth} = $layerInfo->getWidth();
        $self->{initHeight} = $layerInfo->getHeight();
        $self->{groupInterface} = $groupInterface;
        $self->{pickupBehavior} = 'org::allbinary::game::layer::pickup::PickupBehavior'->getNullInstance();
    return $self;
}


# throws Exception
sub initPosition {
    my ($self) = @_;
        $self->setPosition($self->{initX}, $self->{initY}, $self->{initZ});
}


# throws Exception
sub initPositionXYZ {
    my ($self, $x, $y, $z) = @_;
        $self->{initX} = $x;
        $self->{initY} = $y;
        $self->{initZ} = $z;
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paint($graphics);
}


# throws Exception
sub damage {
    my ($self, $damage, $damageType) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub getDamage {
    my ($self, $damageType) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub isDestroyed {
    my ($self) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


sub getGroupInterface {
    my ($self) = @_;
        return $self->{groupInterface};
}


sub setGroupInterface {
    my ($self, $teamInterface) = @_;
        $self->{groupInterface} = $teamInterface;
}


# throws Exception
sub setAllBinaryGameLayerManager {
    my ($self, $allBinaryGameLayerManager) = @_;
        $self->{allBinaryGameLayerManagerP} = $allBinaryGameLayerManager;
        if (!defined($self->{allBinaryGameLayerManagerP})) {
            die ("RuntimeException");
        }
}


sub isReadyForExplosion {
    my ($self) = @_;
        return $self->{readyForExplosion};
}


sub setReadyForExplosion {
    my ($self, $isReadyForExplosion) = @_;
        $self->{readyForExplosion} = $isReadyForExplosion;
}


sub getInitWidth {
    my ($self) = @_;
        return $self->{initWidth};
}


sub getInitHeight {
    my ($self) = @_;
        return $self->{initHeight};
}


sub getInitX {
    my ($self) = @_;
        return $self->{initX};
}


sub getInitY {
    my ($self) = @_;
        return $self->{initY};
}


# throws Exception
sub up {
    my ($self) = @_;
}


# throws Exception
sub down {
    my ($self) = @_;
}


# throws Exception
sub right {
    my ($self) = @_;
}


# throws Exception
sub left {
    my ($self) = @_;
}


# throws Exception
sub strafeLeft {
    my ($self) = @_;
}


# throws Exception
sub strafeRight {
    my ($self) = @_;
}


# throws Exception
sub fire {
    my ($self, $layerManager, $gameKeyEvent) = @_;
}


# throws Exception
sub special1 {
    my ($self, $layerManager, $gameKeyEvent) = @_;
}


# throws Exception
sub special2 {
    my ($self, $layerManager, $gameKeyEvent) = @_;
}


# throws Exception
sub special3 {
    my ($self, $layerManager, $gameKeyEvent) = @_;
}


# throws Exception
sub special4 {
    my ($self, $layerManager, $gameKeyEvent) = @_;
}


# throws Exception
sub special5 {
    my ($self, $layerManager, $gameKeyEvent) = @_;
}


# throws Exception
sub upAnalog {
    my ($self, $yAnalogValue) = @_;
}


# throws Exception
sub downAnalog {
    my ($self, $yAnalogValue) = @_;
}


# throws Exception
sub rightAnalog {
    my ($self, $xAnalogValue) = @_;
}


# throws Exception
sub leftAnalog {
    my ($self, $xAnalogValue) = @_;
}


# throws Exception
sub rightTrigger {
    my ($self, $layerManager, $gameKeyEvent, $xAnalogValue) = @_;
}


# throws Exception
sub leftTrigger {
    my ($self, $layerManager, $gameKeyEvent, $xAnalogValue) = @_;
}


sub onDestroyed {
    my ($self, $destroyedEvent) = @_;
}


sub getPickupBehavior {
    my ($self) = @_;
        return $self->{pickupBehavior};
}


sub setPickupBehavior {
    my ($self, $pickupBehavior) = @_;
        $self->{pickupBehavior} = $pickupBehavior;
}


# throws Exception
sub addPart {
    my ($self, $pickedUpLayerInterfaceFactoryInterface) = @_;
}


sub setPartInterfaceArray {
    my ($self, $partInterfaceArray) = @_;
        $self->{partInterfaceArrayP} = $partInterfaceArray;
}


sub getPartInterfaceArray {
    my ($self) = @_;
        return $self->{partInterfaceArrayP};
}


sub toStringAppend {
    my ($self, $stringBuffer) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $positionStrings = 'org::allbinary::math::PositionStrings'->getInstance();
        $self->SUPER::toStringAppend($stringBuffer);
        $stringBuffer->append($commonSeps->{NEW_LINE});
        my $groupInterfaceArray = $self->getGroupInterface();
        my $size = scalar(@{$groupInterfaceArray});
        for (my $index = 0; $index < $size; $index++) {
            $stringBuffer->append($groupInterfaceArray->[$index]->toString());
            $stringBuffer->append($commonSeps->{COMMA});
        }
        my $pickupBehavior = $self->getPickupBehavior();
        if (defined($pickupBehavior)) {
            $stringBuffer->append($commonSeps->{NEW_LINE});
            $stringBuffer->append($pickupBehavior->toString());
        }
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append($org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer::READYFOREXPLOSION);
        $stringBuffer->appendboolean($self->{readyForExplosion});
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append($self->{commonStrings}->{INIT});
        $stringBuffer->append($commonSeps->{SPACE});
        $stringBuffer->append($positionStrings->{X_LABEL});
        $stringBuffer->appendint($self->{initX});
        $stringBuffer->append($positionStrings->{Y_LABEL});
        $stringBuffer->appendint($self->{initX});
        $stringBuffer->append($positionStrings->{Z_LABEL});
        $stringBuffer->appendint($self->{initZ});
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $self->toStringAppend($stringBuffer);
        return $stringBuffer->toString();
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::collision::CollidableNeverCollideBehaviorFactory;
use org::allbinary::game::combat::damage::DamageableInterface;
use org::allbinary::game::combat::destroy::DestroyableInterface;
use org::allbinary::game::combat::destroy::event::DestroyedEvent;
use org::allbinary::game::identification::BasicGroupFactory;
use org::allbinary::game::identification::Group;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactoryInterface;
use org::allbinary::game::layer::pickup::PickupBehavior;
use org::allbinary::game::layer::pickup::PickupCompositeInterface;
use org::allbinary::game::part::PartInterface;
use org::allbinary::game::part::PartInterfaceUtil;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::RectangleFactory;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::math::PositionStrings;
use org::allbinary::string::CommonSeps;
use org::allbinary::view::ViewPositionBase;
use org::allbinary::game::layer::special::SpecialGameInputInterface;

1;

