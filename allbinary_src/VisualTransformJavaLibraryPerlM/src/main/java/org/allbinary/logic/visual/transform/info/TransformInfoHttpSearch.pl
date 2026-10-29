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

package org::allbinary::logic::visual::transform::info::TransformInfoHttpSearch;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::TransformInfoHttp';



sub new {
    my ($class, $searchRequest) = @_;
    my $self = $class->SUPER::new($searchRequest->getPropertiesHashMap(), $searchRequest->getPageContext());
        # super(...) made $self above
        if (defined($searchRequest->getStoreFront()->getName())) {
            $self->setStoreName($searchRequest->getStoreFront()->getName());
        } else {
            $self->setStoreName('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        }
        my $dataFileName = $searchRequest->getXslFile();
        $self->setTemplateFile($dataFileName);
    return $self;
}


# throws Exception
sub getPath {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getMainPath());
        $stringBuffer->append('org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH});
        $stringBuffer->append($self->getStoreName());
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        return $stringBuffer->toString();
}


# throws Exception
sub getTemplateFilePath {
    my ($self) = @_;
        return 'org::allbinary::logic::io::path::AbPath'->new($self->getPath(), $self->getTemplateFile());
}


# throws Exception
sub getObjectConfigFilePath {
    my ($self) = @_;
        return 'org::allbinary::logic::io::path::AbPath'->new($self->getPath(), $self->getObjectConfigFile());
}


# throws Exception
sub getDataFilePath {
    my ($self) = @_;
        return 'org::allbinary::logic::io::path::AbPath'->new($self->getPath(), $self->getDataFile());
}

use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::control::search::SearchRequest;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoHttp;

1;

