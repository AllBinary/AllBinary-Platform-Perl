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

package org::allbinary::graphics::form::FormPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::Paintable';


sub _init_fields {
    my ($self) = @_;
    $self->{form} = undef;
}


sub new {
    my ($class, $form) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{form} = $form;
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{form}->paint($graphics);
}


sub getForm {
    my ($self) = @_;
        return $self->{form};
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::paint::Paintable;

1;

