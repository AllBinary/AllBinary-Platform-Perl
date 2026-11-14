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

package org::allbinary::game::configuration::persistance::NullRecordFilter;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','javax::microedition::rms::RecordFilter';

tie our $NULL_RECORD_FILTER, 'java::lang::LazyStatic', sub { 'org::allbinary::game::configuration::persistance::NullRecordFilter'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub matches {
    my ($self, $candidate) = @_;
        return 1;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::rms::RecordFilter ();

1;

