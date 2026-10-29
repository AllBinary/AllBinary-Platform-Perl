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

# Java interface
package org::allbinary::android::activity::SimpleProgressActivityInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub runOnUiThread {
    my ($self, $action) = @_;
    die "abstract method runOnUiThread";
}


# throws Exception
sub onSetProgress {
    my ($self, $value, $text) = @_;
    die "abstract method onSetProgress";
}


# throws Exception
sub onDismissProgress {
    my ($self, $animationSequence) = @_;
    die "abstract method onDismissProgress";
}


# throws Exception
sub onShowProgress {
    my ($self, $indeterminate, $animationSequence) = @_;
    die "abstract method onShowProgress";
}


1;

