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

package org::allbinary::logic::visual::dhtml::html::input::HtmlLengthInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::dhtml::html::input::HtmlValueInput';


sub _init_fields {
    my ($self) = @_;
    $self->{MAXLENGTH} = "MAXLENGTH";
    $self->{SIZE} = "SIZE";
    $self->{length} = undef;
    $self->{size} = undef;
}


sub new {
    my ($class, $before, $type, $name, $value, $after) = @_;
    my $self = $class->SUPER::new($before, $type, $name, $value, $after);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub setMaxLength {
    my ($self, $length) = @_;
        scalar(@{$self}) = ("" . $length);
        $self->addAttribute($self->{MAXLENGTH}, scalar(@{$self}));
}


sub setSize {
    my ($self, $size) = @_;
        $self->{size} = ("" . $size);
        $self->addAttribute($self->{MAXLENGTH}, $self->{size});
}

use org::allbinary::logic::visual::dhtml::html::input::HtmlValueInput;

1;

