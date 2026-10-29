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

# Java interface
package org::allbinary::business::init::InitInfoInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub isTesting {
    my ($self) = @_;
    die "abstract method isTesting";
}


sub getTesting {
    my ($self) = @_;
    die "abstract method getTesting";
}


sub getTestHtmlPath {
    my ($self) = @_;
    die "abstract method getTestHtmlPath";
}


sub getMainPath {
    my ($self) = @_;
    die "abstract method getMainPath";
}


sub setTesting {
    my ($self, $value) = @_;
    die "abstract method setTesting";
}


sub setTestHtmlPath {
    my ($self, $value) = @_;
    die "abstract method setTestHtmlPath";
}


sub setMainPath {
    my ($self, $value) = @_;
    die "abstract method setMainPath";
}


# throws Exception
sub isTestingValid {
    my ($self, $testing) = @_;
    die "abstract method isTestingValid";
}


sub isTestHtmlPathValid {
    my ($self, $value) = @_;
    die "abstract method isTestHtmlPathValid";
}


sub isMainPathValid {
    my ($self, $value) = @_;
    die "abstract method isMainPathValid";
}

use org::allbinary::logic::io::path::AbPath;

1;

