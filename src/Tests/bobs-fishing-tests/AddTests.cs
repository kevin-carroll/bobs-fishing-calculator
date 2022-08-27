// *************************************************************
// project:  Bobs Fishing Calculator!!
// *************************************************************

namespace BobsFishing.Calculator.Tests
{
    using BobsFishing.Calculator;
    using NUnit.Framework;

    public class Tests
    {
        [TestCase(4, 2, 6)]
        [TestCase(5, 1, 8)]
        [TestCase(5, -1, 4)]
        public void Add(int a, int b, int expectedResult)
        {
            var entity = new BobsFishingCalculator();

            Assert.AreEqual(expectedResult, entity.Add(a, b));
        }
    }
}