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

package org::allbinary::game::layer::LayerPlacer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{enumerationUtil} = 'org::allbinary::util::EnumerationUtil'->getInstance();
    $self->{layerInterfaceVisitor} = undef;
    $self->{dimension} = undef;
}


sub new {
    my ($class, $layerInterfaceVisitor, $dimension) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{layerInterfaceVisitor} = $layerInterfaceVisitor;
        $self->{dimension} = $dimension;
    return $self;
}


# throws Exception
sub processList {
    my ($self, $list) = @_;
        my $size = $list->size();
        my $layerPlacementInterface = undef;
        for (my $index = 0; $index < $size; $index++) {
            $layerPlacementInterface = $list->{objectArray}->[$index];
            $self->process($layerPlacementInterface);
        }
}


# throws Exception
sub process {
    my ($self, $layerPlacementInterface) = @_;
        my $relativePoint = $self->getPoint($layerPlacementInterface);
        my $layerInterfaceFactory = 'org::allbinary::layer::LayerInterfaceFactory'->getInstance();
        my $hashtable = $layerPlacementInterface->getInstance();
        my $enumeration = $hashtable->keys();
        my $point = undef;
        my $layerHashtable = undef;
        my $x = 0;
        my $y = 0;
        my $z = 0;
        my $layerInterface = undef;
        while ($self->{enumerationUtil}->hasMoreElements($enumeration)) {
            $point = $self->{enumerationUtil}->nextElement($enumeration);
            $layerHashtable = $hashtable->get($point);
            $x = $point->getX() + $relativePoint->getX();
            $y = $point->getY() + $relativePoint->getY();
            $z = $point->getZ() + $relativePoint->getZ();
            $layerInterface = $layerInterfaceFactory->getNexInstance($layerHashtable, $x, $y, $z);
            $self->{layerInterfaceVisitor}->visit($layerInterface);
        }
}


# throws Exception
sub getPoint {
    my ($self, $layerPlacementInterface) = @_;
        my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
        my $layerPlacementType = $layerPlacementInterface->getLayerType();
        if ($layerPlacementType == 'org::allbinary::game::layer::LayerPlacementTypeFactory'->getInstance()->{MAP}) {
            my $width = $layerPlacementInterface->getWidth();
            my $height = $layerPlacementInterface->getHeight();
            my $x = (($self->{dimension}->getX() - $width) / 2);
            my $y = (($self->{dimension}->getY() - $height) / 2);
            return $pointFactory->createXY($x, $y);
        } elsif ($layerPlacementType == 'org::allbinary::game::layer::LayerPlacementTypeFactory'->getInstance()->{UP}) {
            my $width = $layerPlacementInterface->getWidth();
            my $height = $layerPlacementInterface->getHeight();
            my $x = (($self->{dimension}->getX() - $width) / 2);
            my $y = -$height;
            return $pointFactory->createXY($x, $y);
        } else {
            die ("PlacementType Not Recognized");
        }
}

use java::util::Enumeration;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::LayerInterfaceFactory;
use org::allbinary::layer::LayerInterfaceVisitor;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::EnumerationUtil;
use org::allbinary::game::layer::LayerPlacementTypeFactory;

1;

