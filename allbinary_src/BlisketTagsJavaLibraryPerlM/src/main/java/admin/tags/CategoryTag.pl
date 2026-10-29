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

package admin::tags::CategoryTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::tags::TableTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{xsl} = undef;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->setTagHelperFactory('admin::taghelpers::CategoryHelperFactory'->new());
        $self->setTagRequestHelperFactory('admin::taghelpers::CategoryRequestHelperFactory'->new());
    return $self;
}


sub setXsl {
    my ($self, $value) = @_;
        $self->{xsl} = $value;
}


# throws LicensingException
sub viewCategory {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::CategoryRequestHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $helperClass = ref($anyType);
            my $method = $helperClass->getMethod("viewCategory", undef);
            my $result = $method->invoke($anyType, undef);
            return $result;
        } catch ($e) {
            die $e;
        }
}


# throws LicensingException
sub viewCategories {
    my ($self) = @_;
        try {
            my $anyType = 'admin::taghelpers::CategoryRequestHelperFactory'->new()->getInstance($self->getPropertiesHashMap(), $self->{pageContext});
            my $helperClass = ref($anyType);
            my $method = $helperClass->getMethod("viewCategories", undef);
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
                    $self->getPropertiesHashMap()->put('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{TEMPLATEFILENAME}, $self->{xsl});
                    if ($self->getCommand()->compareTo('org::allbinary::business::category::CategoryData'->getInstance()->{VIEW}) == 0) {
                        my $output = $self->viewCategory();
                        if ($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGEXTRAOUTPUT})) {
                            $self->{pageContext}->getOut()->print($output);
                        }
                    } elsif ($self->getCommand()->compareTo('org::allbinary::business::category::CategoryData'->getInstance()->{VIEW}) == 0) {
                        my $output = $self->viewCategories();
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
use admin::taghelpers::CategoryHelperFactory;
use admin::taghelpers::CategoryRequestHelperFactory;
use org::allbinary::business::category::CategoryData;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::LicensingException;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use admin::tags::TableTag;

1;

