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

package org::allbinary::resources::KeyValueFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::resources::KeyValueFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{MAP} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::resources::KeyValueFactory::instance;
}


sub get {
    my ($self, $key) = @_;
        if (!$self->{MAP}->containsKey($key)) {
            return $key;
        }
        return $self->{MAP}->get($key);
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::StdUtil ();
use org::allbinary::util::ABHashtable ();

1;

