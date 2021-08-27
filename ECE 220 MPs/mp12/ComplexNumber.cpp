#include "ComplexNumber.h"
#include "helper.h"

#define PI 3.14159265

//netid: danahar2, sg49, sri4

ComplexNumber::ComplexNumber()
{
    /* Your code here */
    number_type = COMPLEX;
    magnitude = 0.0;
    phase = 0.0;
    real_component = 0.0;
    imaginary_component = 0.0; 
}

ComplexNumber::ComplexNumber(double rval_real_component, double rval_imaginary_component)
{
    /* Your code here */
    number_type = COMPLEX;
    magnitude = sqrt((rval_real_component*rval_real_component) + (rval_imaginary_component*rval_imaginary_component));
    phase = calculate_phase(rval_real_component, rval_imaginary_component);
    real_component = rval_real_component;
    imaginary_component = rval_imaginary_component;
}

ComplexNumber::ComplexNumber( const ComplexNumber& other )
{
    /* Your code here */
    number_type = other.get_number_type();
    magnitude = other.get_magnitude(); 
    real_component = other.get_real_component();
    imaginary_component = other.get_imaginary_component(); 
    phase = other.get_phase();
}

void ComplexNumber::set_real_component (double rval)
{
    /* Your code here */
    real_component = rval; 
    magnitude = sqrt((rval*rval) + (get_imaginary_component()*get_imaginary_component()));
    phase = calculate_phase(rval, imaginary_component);
}

double ComplexNumber::get_real_component() const
{
    /* Your code here */
    return real_component;
}

void ComplexNumber::set_imaginary_component (double rval)
{
    /* Your code here */
    imaginary_component = rval; 
    magnitude = sqrt((rval*rval) + (get_real_component()*get_real_component()));
    phase = calculate_phase(real_component, rval);
}

double ComplexNumber::get_imaginary_component() const
{
    return imaginary_component;
}

double ComplexNumber::get_magnitude() const{
    return magnitude;
}

double ComplexNumber::get_phase() const{
    return phase;
}

ComplexNumber ComplexNumber::operator + (const ComplexNumber& arg)
{
    return ComplexNumber(arg.get_real_component() + real_component, arg.get_imaginary_component() + imaginary_component);
}

ComplexNumber ComplexNumber::operator - (const ComplexNumber& arg)
{
    return ComplexNumber(real_component -  arg.get_real_component(), imaginary_component - arg.get_imaginary_component());
}

ComplexNumber ComplexNumber::operator * (const ComplexNumber& arg)
{
    double real = real_component * arg.get_real_component() - imaginary_component * arg.get_imaginary_component();
    double imag = real_component * arg.get_imaginary_component() + imaginary_component * arg.get_real_component();

    return ComplexNumber(real, imag);
}

ComplexNumber ComplexNumber::operator / (const ComplexNumber& arg)
{
    ComplexNumber conjugate(arg.get_real_component(), -1 * arg.get_imaginary_component());

    double real = conjugate.get_real_component() * real_component - conjugate.get_imaginary_component() * imaginary_component;
    double imag = conjugate.get_real_component() * imaginary_component + conjugate.get_imaginary_component() * real_component;

    double denom = conjugate.get_real_component() * conjugate.get_real_component() + conjugate.get_imaginary_component() * conjugate.get_imaginary_component();

    return ComplexNumber(real/denom, imag/denom);
}

ComplexNumber ComplexNumber::operator + (const RealNumber& arg)
{
	return ComplexNumber(real_component + arg.get_real_component(), imaginary_component);
}

ComplexNumber ComplexNumber::operator - (const RealNumber& arg)
{
	return ComplexNumber(real_component - arg.get_real_component(), imaginary_component);
}

ComplexNumber ComplexNumber::operator * (const RealNumber& arg)
{
	return ComplexNumber(real_component * arg.get_real_component(),imaginary_component * arg.get_real_component());
}

ComplexNumber ComplexNumber::operator / (const RealNumber& arg)
{
    /* Your code here */
	return ComplexNumber(real_component / arg.get_real_component(), imaginary_component/arg.get_real_component());
}

ComplexNumber ComplexNumber::operator + (const ImaginaryNumber& arg){
    /* Your code here */
	return ComplexNumber(real_component, imaginary_component + arg.get_imaginary_component());
}

ComplexNumber ComplexNumber::operator - (const ImaginaryNumber& arg)
{
    /* Your code here */
	return ComplexNumber(real_component, imaginary_component - arg.get_imaginary_component());
}

ComplexNumber ComplexNumber::operator * (const ImaginaryNumber& arg)
{
    ComplexNumber c1(0, arg.get_imaginary_component());
    ComplexNumber c2 = operator*(c1);

	return ComplexNumber(c2.get_real_component(), c2.get_imaginary_component());
}

ComplexNumber ComplexNumber::operator / (const ImaginaryNumber& arg)
{
    return ComplexNumber((imaginary_component / arg.get_imaginary_component()), -1 *real_component / arg.get_imaginary_component());
}

string ComplexNumber::to_String(){
    /* Do not modify */
    stringstream my_output;
    if (imaginary_component > 0)
        my_output << std::setprecision(3) << real_component << " + " << imaginary_component << 'i';
    else if (imaginary_component < 0)
        my_output << std::setprecision(3) << real_component << " - " << abs(imaginary_component) << 'i';
    else
        my_output << std::setprecision(3) << real_component;
    
    return my_output.str();
}