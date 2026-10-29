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

#NoPlatform
package org::allbinary::canvas::GameStatisticsFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::canvas::BaseGameStatistics';

our $instance = 'org::allbinary::canvas::GameStatisticsFactory'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::canvas::GameStatisticsFactory::instance;
}


sub add {
    my ($self, $string) = @_;
}


sub toString {
    my ($self) = @_;
        die ("RuntimeException");
}

use org::allbinary::canvas::BaseGameStatistics;

1;

