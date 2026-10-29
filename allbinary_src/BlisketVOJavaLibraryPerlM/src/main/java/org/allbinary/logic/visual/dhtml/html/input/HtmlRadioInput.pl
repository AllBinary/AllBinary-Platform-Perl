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

package org::allbinary::logic::visual::dhtml::html::input::HtmlRadioInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::dhtml::html::input::HtmlValueInput';


sub _init_fields {
    my ($self) = @_;
    $self->{CHECKED} = "checked";
}


sub new {
    my ($class, $before, $name, $value, $after) = @_;
    my $self = $class->SUPER::new($before, 'org::allbinary::logic::visual::dhtml::html::input::HtmlInputData'->getInstance()->{RADIO}, $name, $value, $after);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub setSelected {
    my ($self) = @_;
        $self->SUPER::addAttribute($self->{CHECKED}, 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{TRUE_STRING});
}

use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::visual::dhtml::html::input::HtmlValueInput;
use org::allbinary::logic::visual::dhtml::html::input::HtmlInputData;

1;

