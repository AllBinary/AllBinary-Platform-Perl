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

package org::allbinary::logic::visual::transform::info::TransformInfoHttpStore;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::TransformInfoHttp','org::allbinary::logic::visual::transform::info::TransformInfoHttpStoreInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    die "No constructor of TransformInfoHttpStore takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new($propertiesHashMap, $pageContext, 1);
    $self->_init_fields();
        # super(...) made $self above
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Properties HashMap: " . $propertiesHashMap->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


sub _new3 {
    my ($class, $databaseHashMap, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new($databaseHashMap, $propertiesHashMap, $pageContext);
    $self->_init_fields();
        # super(...) made $self above
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Database HashMap: ");
            $stringBuffer->append($databaseHashMap->toString());
            $stringBuffer->append("\nProperties HashMap: ");
            $stringBuffer->append($propertiesHashMap->toString());
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "Constructor(HashMap, HashMap , PageContext)");
        }
        $self->setStoreName($databaseHashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}));
    return $self;
}


sub _new3 {
    my ($class, $storeFrontInterface, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new($propertiesHashMap, $pageContext);
    $self->_init_fields();
        # super(...) made $self above
        if ($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Properties HashMap: " . $propertiesHashMap->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        $self->setStoreName($storeFrontInterface->getName());
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

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::info::TransformInfoHttp;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpStoreInterface;

1;

