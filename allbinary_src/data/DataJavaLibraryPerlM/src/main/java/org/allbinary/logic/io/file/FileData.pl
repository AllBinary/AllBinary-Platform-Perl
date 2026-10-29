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

package org::allbinary::logic::io::file::FileData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::file::FileData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = "FILE_NAME";
    $self->{ISFILE} = "FILE_ISFILE";
    $self->{ISDIRECTORY} = "FILE_ISDIRECTORY";
    $self->{ISHIDDEN} = "FILE_ISHIDDEN";
    $self->{ISABSOLUTE} = "FILE_ISABSOLUTE";
    $self->{ROOT_NAME} = "FILE_ROOT_NAME";
    $self->{PATH} = "FILE_PATH";
    $self->{ABSOLUTE_PATH} = "FILE_ABSOLUTE_PATH";
    $self->{CANONICAL_PATH} = "FILE_CANONICAL_PATH";
    $self->{PARENT} = "FILE_PARENT";
    $self->{MINLEN} = 1;
    $self->{MAXLEN} = 120;
    $self->{MAXIMAGEFILESIZE} = 1048576;
    $self->{MINIMAGEFILESIZE} = 32;
    $self->{MAXDOWNLOADABLEFILESIZE} = 1048576 * 20;
    $self->{MINDOWNLOADABLEFILESIZE} = 1;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::FileData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

