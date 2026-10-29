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

package org::allbinary::graphics::color::ColorLevel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $COLOR_MASK = 0x00FFFFFF;
our $MIN = 0x44;
our $AVG = 0x77;
our $LIGHT = 0xAA;
our $HIGH = 0xEE;


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

