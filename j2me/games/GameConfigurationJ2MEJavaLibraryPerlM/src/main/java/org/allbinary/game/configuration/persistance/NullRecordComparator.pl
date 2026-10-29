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

package org::allbinary::game::configuration::persistance::NullRecordComparator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::rms::RecordComparator';

our $NULL_RECORD_COMPARATOR = 'org::allbinary::game::configuration::persistance::NullRecordComparator'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub compare {
    my ($self, $rec1, $rec2) = @_;
        return 0;
}

# use javax::microedition::rms::RecordComparator;

1;

