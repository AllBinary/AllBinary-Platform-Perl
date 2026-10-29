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

package org::allbinary::business::category::properties::root::store::theme::RootStoreThemeCategoryProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::category::properties::root::store::RootStoreCategoryProperties';


sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    die "No constructor of RootStoreThemeCategoryProperties takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
        # super(...) made $self above
    return $self;
}


sub _new2 {
    my ($class, $transformInfoInterface, $abPath) = @_;
    my $self = $class->SUPER::new($transformInfoInterface, $abPath);
        # super(...) made $self above
    return $self;
}


sub _new2 {
    my ($class, $transformInfoInterface, $node) = @_;
    my $self = $class->SUPER::new($transformInfoInterface, $node);
        # super(...) made $self above
    return $self;
}


sub _new2 {
    my ($class, $transformInfoInterface, $categoryPropertiesHashMap) = @_;
    my $self = $class->SUPER::new($transformInfoInterface, $categoryPropertiesHashMap);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub initPath {
    my ($self) = @_;
        my $transformInfoHttpStoreInterface = $self->{transformInfoInterface};
        my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($transformInfoHttpStoreInterface->getStoreName());
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        $stringBuffer->append('org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH});
        $stringBuffer->append($storeFrontInterface->getName());
        $stringBuffer->append('org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        $stringBuffer->append('org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{THEMEPATH});
        my $abPath = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        my $httpServletRequest = $transformInfoHttpStoreInterface->getPageContext()->getRequest();
        $self->{webAppAbPath} = 'org::allbinary::logic::io::path::AbPath'->new($httpServletRequest->getContextPath() . $abPath->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
        $self->setRootFilePath('org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getMainPath() . $abPath->toString(), 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}));
}

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::category::properties::root::store::RootStoreCategoryProperties;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpStoreInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Node;

1;

