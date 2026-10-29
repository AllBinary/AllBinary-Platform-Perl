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

package org::allbinary::game::collision::CollidableBaseBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::collision::CollidableInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{layerCollisionUtil} = 'org::allbinary::game::collision::LayerCollisionUtil'->getInstance();
    $self->{collidable} = 1;
}


sub new {
    my ($class, $collidable) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{collidable} = $collidable;
    return $self;
}


sub update {
    my ($self) = @_;
}


sub getName {
    my ($self) = @_;
        return ref($self);
}


sub setCollidable {
    my ($self, $collidable) = @_;
        $self->{collidable} = $collidable;
}


sub isCollidable {
    my ($self, $ownerLayer) = @_;
        return $self->{collidable};
}


# throws Exception
sub collide {
    my ($self, $ownerLayer, $allbinaryCollidableLayer) = @_;
        die ('org::allbinary::logic::string::StringMaker'->new()->append($self->{commonStrings}->{NOT_IMPLEMENTED})->append('org::allbinary::string::CommonLabels'->getInstance()->{COLON_SEP})->append(ref($self))->toString());
}


sub isCollision {
    my ($self, $ownerLayer, $collisionLayer) = @_;
        return $self->{layerCollisionUtil}->isCollision($ownerLayer, $collisionLayer);
}


sub isCollisionInterface {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        return $self->{layerCollisionUtil}->isCollision($ownerLayer, $collidableInterfaceCompositeInterface);
}


# throws Exception
sub collideInterface {
    my ($self, $ownerLayer, $collidableInterfaceCompositeInterface) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


sub paint {
    my ($self, $ownerLayer, $graphics) = @_;
}


sub getCollisionTypeWith {
    my ($self, $layerInterface) = @_;
        return 'org::allbinary::game::collision::CollisionTypeFactory'->getInstance()->{NONE};
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::layer::CollidableCompositeLayer;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::collision::CollidableInterface;
use org::allbinary::game::collision::LayerCollisionUtil;
use org::allbinary::game::collision::CollisionTypeFactory;

1;

