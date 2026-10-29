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

package org::allbinary::graphics::form::ItemIndexPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::form::ItemIndexPaintable'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::form::ItemIndexPaintable::instance;
}


# throws Exception
sub paint {
    my ($self, $graphics, $index, $item, $dx, $dy) = @_;
        return 0;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::form::item::ABCustomItem;

1;

