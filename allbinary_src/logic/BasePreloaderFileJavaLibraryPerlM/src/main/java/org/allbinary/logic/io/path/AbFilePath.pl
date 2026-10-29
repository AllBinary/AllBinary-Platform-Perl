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

package org::allbinary::logic::io::path::AbFilePath;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::io::path::AbPath';



sub new {
    my ($class, $aPath) = @_;
    my $self = $class->SUPER::new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        # super(...) made $self above
        my $pathData = 'org::allbinary::logic::io::path::AbPathData'->getInstance();
        my $abPathUtil = 'org::allbinary::logic::io::path::PathUtil'->getInstance();
        $self->{schema} = $self->getSchema($aPath);
        $self->setName($pathData->getNameFromPath($aPath));
        $self->setPath($abPathUtil->adjust($self->getPathFromPath($abPathUtil->removeNameFromPath($aPath)->toString())));
    return $self;
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::io::path::PathUtil;

1;

