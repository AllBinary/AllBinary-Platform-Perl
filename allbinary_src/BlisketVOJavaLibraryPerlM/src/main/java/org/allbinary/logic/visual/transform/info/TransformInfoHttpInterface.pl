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
package org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::TransformInfoInterface';



sub getWeblisketSession {
    my ($self) = @_;
    die "abstract method getWeblisketSession";
}


sub getPageContext {
    my ($self) = @_;
    die "abstract method getPageContext";
}


sub getPropertiesHashMap {
    my ($self) = @_;
    die "abstract method getPropertiesHashMap";
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::logic::communication::http::request::session::WeblisketSessionInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;

1;

