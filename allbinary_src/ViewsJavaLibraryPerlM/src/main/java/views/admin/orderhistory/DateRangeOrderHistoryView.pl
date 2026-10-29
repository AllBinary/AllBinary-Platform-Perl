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

package views::admin::orderhistory::DateRangeOrderHistoryView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::logic::control::validate::ValidationComponentInterface','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{VIEWALLORDERS} = "View All";
    $self->{VIEWORDERSINLASTHOUR} = "Last Hour";
    $self->{VIEWORDERSINLASTDAY} = "Last Day";
    $self->{VIEWORDERSINLASTWEEK} = "Last Week";
    $self->{VIEWORDERSINLAST30DAYS} = "30 Days";
    $self->{request} = undef;
    $self->{shipped} = undef;
    $self->{partiallyShipped} = undef;
    $self->{processing} = undef;
    $self->{preprocessing} = undef;
    $self->{cancelled} = undef;
    $self->{dateType} = undef;
    $self->{toDate} = undef;
    $self->{fromDate} = undef;
    $self->{fromYear} = undef;
    $self->{fromMonth} = undef;
    $self->{fromDay} = undef;
    $self->{fromHour} = undef;
    $self->{toYear} = undef;
    $self->{toMonth} = undef;
    $self->{toDay} = undef;
    $self->{toHour} = undef;
    $self->{command} = undef;
    $self->{ON} = "on";
    $self->{MAXLEN} = 15;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{request} = $self->getPageContext()->getRequest();
        $self->getFormData();
    return $self;
}


sub getFormData {
    my ($self) = @_;
        $self->{dateType} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::DATETYPE);
        $self->{preprocessing} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PREPROCESSINGNAME);
        $self->{shipped} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPEDNAME);
        $self->{partiallyShipped} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PARTIALLYSHIPPEDNAME);
        $self->{processing} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PROCESSINGNAME);
        $self->{cancelled} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELLEDNAME);
        $self->{fromYear} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::FROMYEAR);
        $self->{fromMonth} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::FROMMONTH);
        $self->{fromDay} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::FROMDAY);
        $self->{fromHour} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::FROMHOUR);
        $self->{toYear} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TOYEAR);
        $self->{toMonth} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TOMONTH);
        $self->{toDay} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TODAY);
        $self->{toHour} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TOHOUR);
        $self->{command} = $self->{request}->getParameter($org::allbinary::globals::GLOBALS2::ADMINCOMMAND);
}


sub addDomNodeInterfaces {
    my ($self) = @_;
        $self->addDomNodeInterface($self);
}


# throws Exception
sub view {
    my ($self) = @_;
        try {
            $self->addDomNodeInterfaces();
            return $self->SUPER::view();
        } catch ($e) {
            if ($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}


sub toXmlNode {
    my ($self, $document) = @_;
        try {
            if ($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Attempt to View orders in (fromDate=");
                $stringBuffer->append($self->{fromDate});
                $stringBuffer->append(",toDate=");
                $stringBuffer->append($self->{toDate});
                $stringBuffer->append(") and status");
                $self->{logUtil}->putF($stringBuffer->toString(), $self, "view");
            }
            my $node = $document->createElement($org::allbinary::business::user::commerce::inventory::order::OrderData::ORDERS);
            if (defined($self->{preprocessing}) && ($self->{preprocessing} cmp $self->{ON}) == 0) {
                if ($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("Adding Preprocessing Orders", $self, "toXmlNode");
                }
                my $orderHistoryVector = 'org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory'->getInstance()->getOrders($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PREPROCESSING, $self->{fromDate}, $self->{toDate});
                my $size = $orderHistoryVector->size();
                for (my $index = 0; $index < $size; $index++) {
                    my $orderHistory = $orderHistoryVector->get($index);
                    $node->appendChild($orderHistory->toXmlNode($document));
                }
            }
            if (defined($self->{shipped}) && ($self->{shipped} cmp $self->{ON}) == 0) {
                if ($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("Adding Shipped Orders", $self, "toXmlNode");
                }
                my $orderHistoryVector = 'org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory'->getInstance()->getOrders($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPED, $self->{fromDate}, $self->{toDate});
                my $size = $orderHistoryVector->size();
                for (my $index = 0; $index < $size; $index++) {
                    my $orderHistory = $orderHistoryVector->get($index);
                    $node->appendChild($orderHistory->toXmlNode($document));
                }
            }
            if (defined($self->{partiallyShipped}) && ($self->{partiallyShipped} cmp $self->{ON}) == 0) {
                if ($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("Adding Partially Shipped Orders", $self, "toDomNode");
                }
                my $orderHistoryVector = 'org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory'->getInstance()->getOrders($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PARTIALLYSHIPPED, $self->{fromDate}, $self->{toDate});
                my $size = $orderHistoryVector->size();
                for (my $index = 0; $index < $size; $index++) {
                    my $orderHistory = $orderHistoryVector->get($index);
                    $node->appendChild($orderHistory->toXmlNode($document));
                }
            }
            if (defined($self->{processing}) && ($self->{processing} cmp $self->{ON}) == 0) {
                if ($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("Adding Processing Orders", $self, "toXmlNode");
                }
                my $orderHistoryVector = 'org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory'->getInstance()->getOrders($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PROCESSING, $self->{fromDate}, $self->{toDate});
                my $size = $orderHistoryVector->size();
                for (my $index = 0; $index < $size; $index++) {
                    my $orderHistory = $orderHistoryVector->get($index);
                    $node->appendChild($orderHistory->toXmlNode($document));
                }
            }
            if (defined($self->{cancelled}) && ($self->{cancelled} cmp $self->{ON}) == 0) {
                if ($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF("Adding Cancelled Orders", $self, "view");
                }
                my $orderHistoryVector = 'org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory'->getInstance()->getOrders($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELLED, $self->{fromDate}, $self->{toDate});
                my $size = $orderHistoryVector->size();
                for (my $index = 0; $index < $size; $index++) {
                    my $orderHistory = $orderHistoryVector->get($index);
                    $node->appendChild($orderHistory->toXmlNode($document));
                }
            }
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PREPROCESSINGNAME, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PREPROCESSING));
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PROCESSINGNAME, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PROCESSING));
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELLEDNAME, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELLED));
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PARTIALLYSHIPPEDNAME, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PARTIALLYSHIPPED));
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPEDNAME, $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPED));
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::globals::GLOBALS2::VIEWNAME, $org::allbinary::globals::GLOBALS2::VIEW));
            return $node;
        } catch ($e) {
            if ($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{XSLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "toXmlNode", $e);
            }
            return undef;
        }
}


sub isValid {
    my ($self) = @_;
        try {
            my $isValid = 1;
            if (!defined($self->{dateType}) || (($self->{dateType} cmp $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TYPELONG) != 0 && ($self->{dateType} cmp $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TYPECAESAR) != 0)) {
                $isValid = 0;
            }
            if (defined($self->{dateType})) {
                if (($self->{dateType} cmp $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TYPELONG) == 0) {
                    my $calendar = 'java::util::Calendar'->getInstance();
                    my $currentTime = $calendar->getTimeInMillis();
                    my $rangeDate = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
                    if (($self->{command} cmp $self->{VIEWORDERSINLASTHOUR}) == 0) {
                        my $oneHour = 60 * 60 * 1000;
                        $rangeDate = $oneHour->toString();
                    } elsif (($self->{command} cmp $self->{VIEWORDERSINLASTDAY}) == 0) {
                        my $oneDay = 24 * 60 * 60 * 1000;
                        $rangeDate = $oneDay->toString();
                    } elsif (($self->{command} cmp $self->{VIEWORDERSINLASTWEEK}) == 0) {
                        my $oneWeek = 7 * 24 * 60 * 60 * 1000;
                        $rangeDate = $oneWeek->toString();
                    } elsif (($self->{command} cmp $self->{VIEWORDERSINLAST30DAYS}) == 0) {
                        my $thirtyDays = 30 * 24 * 60 * 60 * 1000;
                        $rangeDate = $thirtyDays->toString();
                    } elsif (($self->{command} cmp $self->{VIEWALLORDERS}) == 0) {
                        $rangeDate = $currentTime->toString();
                    }
                    my $rangeDateLong = int($rangeDate);
                    $self->{fromDate} = $currentTime - $rangeDateLong->toString();
                    my $time = ("" . $currentTime->toString());
                    $self->{toDate} = $time;
                } elsif (($self->{dateType} cmp $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TYPECAESAR) == 0) {
                    my $calendar = 'java::util::Calendar'->getInstance();
                    'org::allbinary::time::TimeUtil'->getInstance()->setCalendar($calendar, $self->{fromYear}, $self->{fromMonth}, $self->{fromDay}, $self->{fromHour});
                    $self->{fromDate} = $calendar->getTimeInMillis()->toString();
                    'org::allbinary::time::TimeUtil'->getInstance()->setCalendar($calendar, $self->{toYear}, $self->{toMonth}, $self->{toDay}, $self->{toHour});
                    $self->{toDate} = $calendar->getTimeInMillis()->toString();
                }
                if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{toDate}) || length($self->{toDate}) > $self->{MAXLEN}) {
                    $isValid = 0;
                }
                if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{fromDate}) || length($self->{fromDate}) > $self->{MAXLEN}) {
                    $isValid = 0;
                }
            }
            if ($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Attempt to View orders in (fromDate=");
                $stringBuffer->append($self->{fromDate});
                $stringBuffer->append(",toDate=");
                $stringBuffer->append($self->{toDate});
                $stringBuffer->append(")");
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{IS_VALID});
            }
            return $isValid;
        } catch ($e) {
            if ($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->put("Exception in validation", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}


# throws Exception
sub validationInfo {
    my ($self) = @_;
        try {
            my $result = 'org::allbinary::logic::string::StringMaker'->new();
            if (!defined($self->{dateType}) || (($self->{dateType} cmp $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TYPELONG) != 0 && ($self->{dateType} cmp $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::TYPECAESAR) != 0)) {
                $result->append("DATETYPE not recognized");
            }
            if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{toDate}) || length($self->{toDate}) > $self->{MAXLEN}) {
                $result->append("Invalid To Date");
            }
            if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{fromDate}) || length($self->{fromDate}) > $self->{MAXLEN}) {
                $result->append("Invalid From Date");
            }
            return $result->toString();
        } catch ($e) {
            if ($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::orderhistory::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Getting Validation Info";
        }
}

use java::util::Calendar;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::business::user::commerce::inventory::order::OrderData;
use org::allbinary::business::user::commerce::inventory::order::OrderHistory;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::globals::GLOBALS2;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::time::TimeUtil;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

