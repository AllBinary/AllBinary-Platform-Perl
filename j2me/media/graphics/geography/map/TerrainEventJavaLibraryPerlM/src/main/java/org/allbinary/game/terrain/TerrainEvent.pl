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

package org::allbinary::game::terrain::TerrainEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{basicTerrainInfo} = $org::allbinary::game::terrain::BasicTerrainInfo::NULL_BASIC_TERRAIN_INFO;
}


sub new {
    my ($class, $basicTerrainInfo) = @_;
    my $self = $class->SUPER::new($basicTerrainInfo);
    $self->_init_fields();
        # super(...) made $self above
        $self->setBasicTerrainInfo($self->{basicTerrainInfo});
    return $self;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("TerrainEvent: \n");
        $stringBuffer->append("LayerInterface: ");
        $stringBuffer->append($self->{basicTerrainInfo}->toString());
        return $stringBuffer->toString();
}


sub getBasicTerrainInfo {
    my ($self) = @_;
        return $self->{basicTerrainInfo};
}


sub setBasicTerrainInfo {
    my ($self, $basicTerrainInfo) = @_;
        $self->{basicTerrainInfo} = $basicTerrainInfo;
}


sub setBasicTerrainInfoForCircularStaticPool {
    my ($self, $basicTerrainInfo) = @_;
        $self->{basicTerrainInfo} = $basicTerrainInfo;
}

use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::game::terrain::BasicTerrainInfo;

1;

