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

package org::allbinary::logic::visual::transform::data::TransformStoreDocument;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::data::TransformHttpRequestDocument';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of TransformStoreDocument takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $pageContext, $weblisketSession) = @_;
    my $self = $class->SUPER::new($pageContext, $weblisketSession);
    $self->_init_fields();
        # super(...) made $self above
        try {
            my $storeName = $weblisketSession->getStoreName();
            if ($org::allbinary::logic::visual::transform::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Using Session StoreName: " . $storeName, $self, $self->{commonStrings}->{CONSTRUCTOR});
            }
            $self->getBaseNode()->appendChild('org::allbinary::business::context::modules::storefront::StoreFrontViewFactory'->getInstance($storeName)->toXmlNode($self->getDoc()));
            $self->getBaseNode()->appendChild('org::allbinary::logic::communication::http::request::RequestParams'->new($pageContext->getRequest())->toXmlNode($self->getDoc()));
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
            }
            die $e;
        }
    return $self;
}


sub _new1 {
    my ($class, $searchRequest) = @_;
    my $self = $class->SUPER::new($searchRequest);
    $self->_init_fields();
        # super(...) made $self above
        try {
            $self->getBaseNode()->appendChild('org::allbinary::business::context::modules::storefront::StoreFrontViewFactory'->getInstance($searchRequest->getStoreFront()->getName())->toXmlNode($self->getDoc()));
            $self->getBaseNode()->appendChild($searchRequest->getParams()->getParamsNode($self->getDoc()));
        } catch ($e) {
            if ($org::allbinary::logic::visual::transform::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::data::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
            }
            die $e;
        }
    return $self;
}

# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFrontViewFactory;
use org::allbinary::logic::communication::http::request::RequestParams;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::search::SearchRequest;
use org::allbinary::logic::visual::transform::data::TransformHttpRequestDocument;

1;

