# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::media::graphics::geography::map::racetrack::CustomMapGeneratorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::graphics::geography::map::racetrack::CustomMapGeneratorBaseFactory';


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws Exception
sub create {
    my ($self, $raceTrackGeographicMap) = @_;
        return 'org::allbinary::media::graphics::geography::map::racetrack::CustomMapGenerator'->new($raceTrackGeographicMap);
}

use org::allbinary::media::graphics::geography::map::racetrack::CustomMapGeneratorBaseFactory;
use org::allbinary::media::graphics::geography::map::racetrack::CustomMapGenerator;

1;

