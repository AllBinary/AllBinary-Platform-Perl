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

package org::allbinary::logic::util::cache::BaseBasicArrayListCache;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub log {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("S: ");
        $stringBuffer->appendint($self->{list}->size());
        return $stringBuffer->toString();
}

# use jsinterop::annotations::JsType;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsProperty;

1;

