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

package admin::tags::StaticPagesTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::tags::TableTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{xslFile} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->setTagHelperFactory('admin::taghelpers::StaticPagesHelperFactory'->new());
        $self->setTagRequestHelperFactory('admin::taghelpers::StaticPagesRequestHelperFactory'->new());
    return $self;
}


sub setXsl {
    my ($self, $value) = @_;
        $self->{xslFile} = $value;
}


# throws LicensingException
sub generateStaticPages {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::StaticPagesRequestHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $helperClass = ref($anyType);
            my $method = $helperClass->getMethod("generateStaticPages", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub makePublic {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::StaticPagesRequestHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $helperClass = ref($anyType);
            my $method = $helperClass->getMethod("makePublic", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            die $e;
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if ($self->isEnabled()) {
                if (defined($self->getCommand())) {
                    if ($self->getCommand()->compareTo($org::allbinary::logic::control::search::SearchData::GENERATESTATICPAGES) == 0) {
                        $self->getPropertiesHashMap()->put('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{TEMPLATEFILENAME}, $self->{xslFile});
                        my $output = $self->generateStaticPages();
                        if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGEXTRAOUTPUT})) {
                            $self->{pageContext}->getOut()->print($output);
                        }
                    } elsif ($self->getCommand()->compareTo($org::allbinary::logic::control::search::SearchData::MAKEPUBLIC) == 0) {
                        my $output = $self->makePublic();
                        if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGEXTRAOUTPUT})) {
                            $self->{pageContext}->getOut()->print($output);
                        }
                    } else {
                        return $self->SUPER::doStartTag();
                    }
                }
            }
            return $self->{SKIP_BODY};
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagLicensingRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use java::lang::reflect::Method;
# use javax::servlet::jsp::JspTagException;
use admin::taghelpers::StaticPagesHelperFactory;
use admin::taghelpers::StaticPagesRequestHelperFactory;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::search::SearchData;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use admin::tags::TableTag;

1;

