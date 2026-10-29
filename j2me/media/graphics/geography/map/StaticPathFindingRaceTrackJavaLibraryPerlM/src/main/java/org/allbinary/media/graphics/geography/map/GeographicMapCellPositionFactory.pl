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

package org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::GeographicMapCellPositionBaseFactory';

our $hashtable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $geographicMapInterface) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $allBinaryTiledLayer = $geographicMapInterface->getAllBinaryTiledLayer();
        my $geographicMapCellPositionFactoryCanBeNull = $org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactory::hashtable->get($allBinaryTiledLayer->getDataId());
        if (!defined($geographicMapCellPositionFactoryCanBeNull)) {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Creating GeographicMapCellPositionFactory for TileLayer: ")->appendint(int(int($allBinaryTiledLayer->getDataId())))->toString(), $self, $commonStrings->{GET_INSTANCE});
            $geographicMapCellPositionFactoryCanBeNull = 'org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory'->new($geographicMapInterface);
            $org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactory::hashtable->put($allBinaryTiledLayer->getDataId(), $geographicMapCellPositionFactoryCanBeNull);
            return $geographicMapCellPositionFactoryCanBeNull;
        } else {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Reusing GeographicMapCellPositionFactory for TileLayer: ")->appendint(int(int($allBinaryTiledLayer->getDataId())))->toString(), $self, $commonStrings->{GET_INSTANCE});
            return $geographicMapCellPositionFactoryCanBeNull;
        }
}


sub getHashtable {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::GeographicMapCellPositionFactory::hashtable;
}

use org::allbinary::string::CommonStrings;
use org::allbinary::game::layer::AllBinaryTiledLayer;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::util::ABHashtable;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPositionBaseFactory;
use org::allbinary::media::graphics::geography::map::BasicGeographicMapCellPositionFactory;

1;

