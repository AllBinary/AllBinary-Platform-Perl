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

package javax::microedition::lcdui::NullImage;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_IMAGE_ARRAY = [(undef) x (0)];
our $NULL_IMAGE = 'javax::microedition::lcdui::Image'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}

use javax::microedition::lcdui::Image;

1;

