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

package org::allbinary::business::category::store::theme::ThemeComparator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::util::Comparator';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub compare {
    my ($self, $anyType, $object2) = @_;
        my $string = $anyType;
        my $string2 = $object2;
        return ($string cmp $string2);
}

# use java::util::Comparator;

1;

