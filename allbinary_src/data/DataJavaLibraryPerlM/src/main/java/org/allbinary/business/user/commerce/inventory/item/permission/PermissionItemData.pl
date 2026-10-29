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

package org::allbinary::business::user::commerce::inventory::item::permission::PermissionItemData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $WHO = "PERMISSIONSITEM_WHO";
our $WHAT = "PERMISSIONSITEM_WHAT";
our $TYPE = "PERMISSIONSITEM_TYPE";
our $START_TIME = "PERMISSIONSITEM_START_TIME";
our $END_TIME = "PERMISSIONSITEM_END_TIME";
our $REMOTE_ADDR = "PERMISSIONSITEM_REMOTE_ADDR";

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

