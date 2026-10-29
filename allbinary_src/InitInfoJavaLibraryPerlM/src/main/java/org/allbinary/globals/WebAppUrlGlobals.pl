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

package org::allbinary::globals::WebAppUrlGlobals;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::globals::UrlGlobalsInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{path} = undef;
    $self->{isWebappPathSet} = 0;
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub isTestingMode {
    my ($self) = @_;
        return 'org::allbinary::business::init::InitInfo'->getInstance()->isTesting();
}


sub getWebappPath {
    my ($self) = @_;
        return $self->{path};
}


sub setWebappPath {
    my ($self, $path) = @_;
        $path = $path;
        $self->{isWebappPathSet} = 1;
}


sub getTestHtmlPath {
    my ($self) = @_;
        return 'org::allbinary::business::init::InitInfo'->getInstance()->getTestHtmlPath();
}


# throws Exception
sub getMainPath {
    my ($self) = @_;
        my $mainPath = 'org::allbinary::business::init::InitInfo'->getInstance()->getMainPath();
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($mainPath)) {
            return $mainPath;
        } elsif ($self->{isWebappPathSet}) {
            return $self->getWebappPath();
        } else {
            die ("Webapp Path is not set");
        }
}

use org::allbinary::business::init::InitInfo;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::globals::UrlGlobalsInterface;

1;

