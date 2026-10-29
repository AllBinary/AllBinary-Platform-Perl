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

package org::allbinary::android::activity::NullProgressActivity;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::activity::ProgressActivityInterface';

our $NULL_PROGRESS_ACTIVITY = 'org::allbinary::android::activity::NullProgressActivity'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub runOnUiThread {
    my ($self, $action) = @_;
}


sub onDismissTitleProgressBar {
    my ($self) = @_;
}


sub onShowTitleProgressBar {
    my ($self, $value, $indeterminate) = @_;
}


sub onTitleProgressBarSetProgress {
    my ($self, $value) = @_;
}

use org::allbinary::android::activity::ProgressActivityInterface;

1;

