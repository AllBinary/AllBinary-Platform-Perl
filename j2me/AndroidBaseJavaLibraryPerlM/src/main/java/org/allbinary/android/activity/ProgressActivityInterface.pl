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
package org::allbinary::android::activity::ProgressActivityInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub runOnUiThread {
    my ($self, $action) = @_;
    die "abstract method runOnUiThread";
}


sub onDismissTitleProgressBar {
    my ($self) = @_;
    die "abstract method onDismissTitleProgressBar";
}


sub onShowTitleProgressBar {
    my ($self, $value, $indeterminate) = @_;
    die "abstract method onShowTitleProgressBar";
}


sub onTitleProgressBarSetProgress {
    my ($self, $value) = @_;
    die "abstract method onTitleProgressBarSetProgress";
}


1;

