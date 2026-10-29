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

package org::allbinary::logic::control::validate::ValidatorBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::validate::ValidatorBaseInterface';

our $instance = 'org::allbinary::logic::control::validate::ValidatorBase'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::control::validate::ValidatorBase::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub isValid {
    my ($self) = @_;
        return 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance()->{TRUE};
}


sub validationInfo {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub toHashtable {
    my ($self) = @_;
        return 'org::allbinary::logic::StdUtil'->getInstance()->{NULL_TABLE};
}


sub toList {
    my ($self) = @_;
        return 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
}

use org::allbinary::logic::StdUtil;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::logic::control::validate::ValidatorBaseInterface;

1;

