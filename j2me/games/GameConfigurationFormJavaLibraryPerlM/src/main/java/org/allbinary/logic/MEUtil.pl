# 
# AllBinary Open License Version 1 
# Copyright (c) 2026 AllBinary 
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

#Handle the differences in the public platform vs the raw JS build
package org::allbinary::logic::MEUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::MEUtil'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::MEUtil::instance;
}


sub appendItem {
    my ($self, $form, $item) = @_;
        $form->append($item);
}

# use javax::microedition::lcdui::Item;
use org::allbinary::graphics::displayable::screen::CommandForm;

1;

