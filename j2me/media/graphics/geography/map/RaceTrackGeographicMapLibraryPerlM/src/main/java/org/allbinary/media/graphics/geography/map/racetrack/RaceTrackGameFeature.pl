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

package org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGameFeature;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::configuration::feature::GameFeature';

tie our $MINI_MAP, 'java::lang::LazyStatic', sub { 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGameFeature'->new("Mini Map") };
tie our $AUTO_FINISH_AI, 'java::lang::LazyStatic', sub { 'org::allbinary::media::graphics::geography::map::racetrack::RaceTrackGameFeature'->new("Auto Finish AI") };


sub new {
    my ($class, $name) = @_;
    my $self = $class->SUPER::new($name);
        # super(...) made $self above
    return $self;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::game::configuration::feature::GameFeature ();

1;

