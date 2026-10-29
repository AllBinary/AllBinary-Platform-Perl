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

package admin::tags::MultipartRequestParamForwardTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::CustomTagSupport';


sub _init_fields {
    my ($self) = @_;
    $self->{page} = undef;
    $self->{command} = undef;
    $self->{paramVector} = undef;
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub setPage {
    my ($self, $page) = @_;
        $self->{page} = $page;
}


sub setCommand {
    my ($self, $command) = @_;
        $self->{command} = $command;
}


sub setParamVector {
    my ($self, $paramVector) = @_;
        $self->{paramVector} = $paramVector;
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            my $parentTag = $self->getParent();
            'admin::tags::ParentInventoryTagHelper'->getInstance()->isValid($self, $parentTag);
            my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
            $hashMap->put($admin::tags::AbTagData::PARENT, $parentTag);
            my $multipartRequestParamForwardHelper = 'admin::taghelpers::MultipartRequestParamForwardHelper'->new($parentTag, $self->{page}, $self->{command}, $self->{paramVector}, $self->{pageContext});
            $multipartRequestParamForwardHelper->forward();
            return $javax::servlet::jsp::tagext::Tag::SKIP_BODY;
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagLicensingRedirect($self->{pageContext}, $e);
            return $javax::servlet::jsp::tagext::Tag::SKIP_BODY;
        }
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::jsp::JspTagException;
# use javax::servlet::jsp::tagext::Tag;
use admin::taghelpers::MultipartRequestParamForwardHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::system::security::licensing::LicensingException;
use tags::CustomTagSupport;
use tags::HelperTag;
use admin::tags::ParentInventoryTagHelper;
use admin::tags::AbTagData;

1;

