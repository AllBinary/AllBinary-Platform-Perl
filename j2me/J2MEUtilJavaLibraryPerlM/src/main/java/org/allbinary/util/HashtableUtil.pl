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

package org::allbinary::util::HashtableUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::util::HashtableUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{enumerationUtil} = 'org::allbinary::util::EnumerationUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::util::HashtableUtil::instance;
}


sub putAll {
    my ($self, $fromHashtable, $hashtable) = @_;
        my $enumeration = $fromHashtable->keys();
        my $keyCanBeNull = undef;
        my $valueCanBeNull = undef;
        while ($self->{enumerationUtil}->hasMoreElements($enumeration)) {
            $keyCanBeNull = $self->{enumerationUtil}->nextElement($enumeration);
            $valueCanBeNull = $hashtable->get($keyCanBeNull);
            if (!defined($valueCanBeNull)) {
            } else {
                $hashtable->put($keyCanBeNull, $valueCanBeNull);
            }
        }
}


sub getKeysAsArray {
    my ($self, $hashtable) = @_;
        my $objectArray = [(undef) x ($hashtable->size())];
        my $index = 0;
        my $enumeration = $hashtable->keys();
        while ($self->{enumerationUtil}->hasMoreElements($enumeration)) {
            $objectArray->[$index++] = $self->{enumerationUtil}->nextElement($enumeration);
        }
        return $objectArray;
}


sub getKeysAsList {
    my ($self, $hashtable) = @_;
        my $list = 'org::allbinary::util::BasicArrayListS'->new($hashtable->size());
        my $enumeration = $hashtable->keys();
        while ($self->{enumerationUtil}->hasMoreElements($enumeration)) {
            $list->add($self->{enumerationUtil}->nextElement($enumeration));
        }
        return $list;
}

use java::util::Enumeration;
# use jsinterop::annotations::JsType;
use org::allbinary::util::EnumerationUtil;
use org::allbinary::util::BasicArrayListS;

1;

