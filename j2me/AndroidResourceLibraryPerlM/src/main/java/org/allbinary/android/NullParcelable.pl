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

package org::allbinary::android::NullParcelable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'android::os::Parcelable';

our $NULL_PARCELABLE = 'org::allbinary::android::NullParcelable'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub describeContents {
    my ($self) = @_;
        die ("RuntimeException");
}


sub writeToParcel {
    my ($self, $dest, $flags) = @_;
}

use android::os::Parcelable;
use android::os::Parcel;

1;

