# 
# AllBinary Open License Version 1 
# Copyright (c) 2026 AllBinary 
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

package org::allbinary::logic::io::file::directory::TrackedStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::file::directory::TrackedStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{TARGET_PATH_WINDOWS} = "\\target\\";
    $self->{TARGET_PATH_UNIX} = "/target/";
    $self->{HTML_TEMP} = "HTMLTemp";
    $self->{APPLICATION} = "Application";
    $self->{APP} = "\\app";
    $self->{GIT_COMMAND} = "git";
    $self->{CHANGE_DIRECTORY_OPTION} = "-C";
    $self->{LIST_FILES_COMMAND} = "ls-files";
    $self->{ERROR_UNMATCH_OPTION} = "--error-unmatch";
    $self->{PATHSPEC_SEPARATOR} = "--";
    $self->{SEP_BY_NULL_CHAR_INSTEAD_OF_NEW_LINE} = "-z";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::file::directory::TrackedStrings::instance;
}


1;

