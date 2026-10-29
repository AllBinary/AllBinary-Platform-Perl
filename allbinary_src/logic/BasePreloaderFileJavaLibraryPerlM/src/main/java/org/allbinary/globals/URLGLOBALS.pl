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

package org::allbinary::globals::URLGLOBALS;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $urlGlobalsInterface = $org::allbinary::globals::AppUrlGlobals::NULL_APP_URL_GLOBALS;

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub init {
    my ($class, $urlGlobalsInterface) = @_;
        $org::allbinary::globals::URLGLOBALS::urlGlobalsInterface = $urlGlobalsInterface;
}


sub isTestingMode {
    my ($class) = @_;
        return $org::allbinary::globals::URLGLOBALS::urlGlobalsInterface->isTestingMode();
}


sub getWebappPath {
    my ($class) = @_;
        return $org::allbinary::globals::URLGLOBALS::urlGlobalsInterface->getWebappPath();
}


sub getTestHtmlPath {
    my ($class) = @_;
        return $org::allbinary::globals::URLGLOBALS::urlGlobalsInterface->getTestHtmlPath();
}


# throws Exception
sub getMainPath {
    my ($class) = @_;
        return $org::allbinary::globals::URLGLOBALS::urlGlobalsInterface->getMainPath();
}

use org::allbinary::globals::AppUrlGlobals;

1;

