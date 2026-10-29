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

#TWB - Am I missing the correct Quote Request? Probably not
package admin::taghelpers::QuoteRequestHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::ModifyTable';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{weblisketSession} = undef;
    $self->{storeFrontInterface} = undef;
    $self->{quoteRequest} = undef;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $request = $pageContext->getRequest();
        $self->{weblisketSession} = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($hashMap, $pageContext);
        $self->{quoteRequest} = 'org::allbinary::business::user::quoterequest::QuoteRequest'->new($self->{weblisketSession}->getUserName(), $request);
        my $storeName = $hashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        if (defined($storeName)) {
            $self->{storeFrontInterface} = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($storeName);
        }
    return $self;
}


sub isValid {
    my ($self) = @_;
        return $self->{quoteRequest}->isValid();
}


sub validationInfo {
    my ($self) = @_;
        return $self->{quoteRequest}->validationInfo();
}


sub insert {
    my ($self) = @_;
        try {
            my $values = $self->{quoteRequest}->toVector();
            'org::allbinary::data::tables::user::quoterequest::QuoteRequestEntityFactory'->getInstance()->getQuoteRequestEntityInstance()->insert($values);
            my $success = "New QuoteRequest Successfully added to the QuoteRequest Table";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "add()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to add QuoteRequest";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "add()", $e);
            }
            return $error;
        }
}


sub update {
    my ($self) = @_;
        try {
            my $values = $self->{quoteRequest}->toHashMap();
            'org::allbinary::data::tables::user::quoterequest::QuoteRequestEntityFactory'->getInstance()->getQuoteRequestEntityInstance()->update($self->{quoteRequest}->getUserName(), $values);
            my $success = "New QuoteRequest Successfully updated";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "update()");
            }
            return $success;
        } catch ($e) {
            my $error = "Failed to update QuoteRequest";
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "update()", $e);
            }
            return $error;
        }
}


sub delete {
    my ($self) = @_;
        return $self->{commonStrings}->{NOT_IMPLEMENTED};
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::quoterequest::QuoteRequest;
use org::allbinary::data::tables::user::quoterequest::QuoteRequestEntityFactory;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::log::LogUtil;
use admin::taghelpers::ModifyTable;

1;

