// *************************************************************
// project:  Bobs Fishing Calculator!!
// *************************************************************

namespace BobsFishing.Calculator.Tests
{
    using BobsFishing.Calculator;
    using NUnit.Framework;

    public class SubtractTests
    {
        [TestCase(4, 2, 2)]
        [TestCase(5, 1, 4)]
        [TestCase(9, 3, 6)]
        [TestCase(5, -1, 6)]
        public void Subtract(int a, int b, int expectedResult)
        {
            var entity = new BobsFishingCalculator();

            Assert.AreEqual(expectedResult, entity.Subtract(a, b));
        }
    }
}