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

package org::allbinary::game::paint::help::UpdateMyFontProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{actionStringArray} = 'org::allbinary::logic::string::StringUtil'->getInstance()->getArrayInstance();
    $self->{keymappingBeginWidthArray} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY};
    $self->{actionStringDeltaXArray} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY};
    $self->{inputDeltaXArray} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY_ARRAY};
    $self->{sepArray} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{ONE_EMPTY_STRING_ARRAY_OF_ARRAYS};
    $self->{sepWidthArray} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY_ARRAY};
    $self->{charHeight} = 0;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}

use java::lang::Object ();
use org::allbinary::logic::NullUtil ();
use org::allbinary::logic::string::StringUtil ();

1;

