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

package org::allbinary::logic::java::characters::CharacterSetData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::java::characters::CharacterSetData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{US_ASCII} = "US-ASCII";
    $self->{ISO_8859_1} = "ISO-8859-1";
    $self->{UTF_8} = "UTF-8";
    $self->{UTF_16} = "UTF-16";
    $self->{UTF_16BE} = "UTF-16BE";
    $self->{UTF_16LE} = "UTF-16LE";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::java::characters::CharacterSetData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

