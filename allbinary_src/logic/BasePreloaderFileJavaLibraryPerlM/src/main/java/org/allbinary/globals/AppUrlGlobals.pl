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

#implements
package org::allbinary::globals::AppUrlGlobals;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::globals::UrlGlobalsInterface';

our $NULL_APP_URL_GLOBALS = 'org::allbinary::globals::AppUrlGlobals'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{path} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub isTestingMode {
    my ($self) = @_;
        return 0;
}


sub getWebappPath {
    my ($self) = @_;
        return $self->{path};
}


sub setWebappPath {
    my ($self, $path) = @_;
        $self->{path} = $path;
        if (!((substr($self->{path}, -length("\\")) eq "\\") || (substr($self->{path}, -length("/")) eq "/"))) {
            $self->{path} = $self->{path} . "\\";
        }
}


sub getTestHtmlPath {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


# throws Exception
sub getMainPath {
    my ($self) = @_;
        return $self->{path};
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::globals::UrlGlobalsInterface;

1;

