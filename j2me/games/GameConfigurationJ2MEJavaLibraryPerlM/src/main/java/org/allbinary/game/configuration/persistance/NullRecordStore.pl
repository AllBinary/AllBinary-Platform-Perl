# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::game::configuration::persistance::NullRecordStore;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::rms::RecordStore';

our $NULL_RECORD_STORE = 'org::allbinary::game::configuration::persistance::NullRecordStore'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}

# use javax::microedition::rms::RecordStore;

1;

