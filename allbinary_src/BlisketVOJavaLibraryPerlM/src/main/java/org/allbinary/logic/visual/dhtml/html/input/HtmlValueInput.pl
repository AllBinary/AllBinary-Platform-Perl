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

package org::allbinary::logic::visual::dhtml::html::input::HtmlValueInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::dhtml::html::input::HtmlInput';


sub _init_fields {
    my ($self) = @_;
    $self->{value} = undef;
    $self->{VALUE} = "VALUE";
}


sub new {
    my ($class, $before, $type, $name, $value, $after) = @_;
    my $self = $class->SUPER::new($before, $type, $name, $after);
    $self->_init_fields();
        # super(...) made $self above
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        $self->{value} = $stringUtil->{EMPTY_STRING};
        $self->addAttribute($self->{VALUE}, $value);
    return $self;
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::visual::dhtml::html::input::HtmlInput;

1;

